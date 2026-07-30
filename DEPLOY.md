# Deploying product_management_system

## Improvements and Fixes Applied
1.  **JDBC Driver Upgrade**: Replaced the ancient `mysql-connector-java-5.1.20` with `mysql-connector-j-8.0.33`. Updated `db.jsp` to use `com.mysql.cj.jdbc.Driver`. This ensures compatibility with modern MySQL 8+ hosts (Railway, Render, Aiven, etc.).
2.  **SQL Injection Hardening**: Migrated all critical JSPs from raw string concatenation to `PreparedStatement`. This includes login handlers, product management, and order processing.
3.  **Refined Schema**: `schema.sql` has been corrected based on a deep analysis of how the application actually uses the database columns.
4.  **Centralized DB connection**: `WebContent/db.jsp` reads `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASS` from environment variables.
5.  **Dockerized**: The project includes a `Dockerfile` based on Tomcat 9 / Java 8 for easy deployment.

## Deployment Steps (Railway)
1.  **Push to GitHub**: Already completed! Your repository is at: `https://github.com/Gus-Fring666/product-management-system`
2.  **Create Railway Project**:
    *   Log in to [Railway](https://railway.app/).
    *   **New Project** → **Deploy from GitHub repo** → Select `product-management-system`.
3.  **Add MySQL**:
    *   In the same project, click **New** → **Database** → **Add MySQL**.
4.  **Initialize Database**:
    *   Go to the MySQL service's **Data** or **Query** tab.
    *   Run the contents of `schema.sql` to create the tables.
5.  **Set Environment Variables**:
    *   Go to your web service (the one from GitHub) → **Variables**.
    *   Add the following variables using the values from the MySQL service's **Connect** tab:
        *   `DB_HOST`
        *   `DB_PORT`
        *   `DB_NAME`
        *   `DB_USER`
        *   `DB_PASS`
6.  **Redeploy**: Railway will automatically redeploy with the new settings.
7.  **Access**: Use the public URL provided by Railway (e.g., `*.up.railway.app`).

## Local Testing
```bash
docker build -t pms .
docker run -e DB_HOST=host.docker.internal -e DB_USER=root -e DB_PASS=yourpass -p 8080:8080 pms
```
Visit `http://localhost:8080`
