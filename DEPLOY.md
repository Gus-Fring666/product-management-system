# Deploying product_management_system

## What changed from your original zip
1. **`WebContent/db.jsp`** — a single shared connection helper. All 15 JSPs that
   used to hardcode `jdbc:mysql://localhost:3306/...`, `"root"`, `""` now call
   `getConnection()`, which reads `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`,
   `DB_PASS` from environment variables. This is what makes it deployable —
   no database credentials are hardcoded in the source anymore.
2. **`schema.sql`** — you had no `.sql` dump, so this was reverse-engineered
   from the INSERT/SELECT statements in the JSPs (table/column names are a
   best guess — check them against your app's behavior after deploying).
3. **`Dockerfile`** — packages the app on Tomcat 9 / Java 8 (matching your
   `.settings` project config) so any host that runs Docker can serve it.

## Known limitation to be aware of
The bundled driver is `mysql-connector-java-5.1.20` (2012). It works fine
against MySQL 5.7. Many free hosted MySQL databases default to MySQL 8 with
`caching_sha2_password` authentication, which this old driver doesn't
support — connections would fail with an auth-plugin error. Options:
- Pick a host/plan that gives you MySQL 5.7, **or**
- Ask your MySQL host to set your user's auth plugin to `mysql_native_password`, **or**
- Swap in `mysql-connector-j-8.x` (download from Maven Central and replace
  the jar in `WebContent/WEB-INF/lib/`, then change `com.mysql.jdbc.Driver`
  to `com.mysql.cj.jdbc.Driver` in `db.jsp`) — I couldn't fetch this jar for
  you from this environment since Maven Central isn't reachable here.

## Steps to deploy (Railway example — free tier available)
1. Push this folder to a new GitHub repo.
2. On Railway: **New Project → Deploy from GitHub repo**, pick the repo.
   Railway detects the `Dockerfile` and builds it automatically.
3. **New → Database → Add MySQL** in the same Railway project.
4. Open the MySQL service's **Connect** tab, copy the host/port/user/password.
   Run `schema.sql` against it (Railway's built-in query console, or
   `mysql -h <host> -P <port> -u <user> -p < schema.sql` from your machine).
5. On your web service, go to **Variables** and add:
   `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASS` (values from step 4).
6. Redeploy. Railway gives you a public `*.up.railway.app` URL — that's your
   shareable link.

Render works the same way (Docker Web Service + a managed MySQL add-on, e.g.
Aiven or PlanetScale, since Render itself doesn't offer MySQL — only Postgres).

## Local test before deploying
```
docker build -t pms .
docker run -e DB_HOST=host.docker.internal -e DB_USER=root -e DB_PASS=yourpass -p 8080:8080 pms
```
Visit http://localhost:8080
