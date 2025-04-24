
# SSIS ETL Package: Multi-Channel Sales Load with Discount Logic

## 💡 Use Case
Ingest and enrich multi-channel transactional sales data for Power BI dashboards focused on regional performance, sales rep productivity, and discount impact analysis.

## 🔄 Flow Structure

- **Source**: CSV input from daily transactional dumps (sales_data_5000.csv)
- **Staging**: Raw data loaded into staging table `stg_sales_data`
- **Transformations**:
  - Derived Column: Revenue = Quantity × UnitPrice × (1 - DiscountRate)
  - Lookup: Region and SalesRep validation
  - Conditional Split: Flag entries with Quantity = 0 or Revenue = 0
  - Audit Columns: Inserted Date, Source System Tag
- **Destination**:
  - Valid Rows → `fact_sales`
  - Invalid Rows → `audit_log_sales_errors`

## 🕒 Schedule & Recovery
- Nightly trigger via SQL Server Agent at 1:00 AM
- Retry mechanism using Checkpoints
- Failures logged to `ssis_log_error_details`

## ✅ Enhancements
- Discount tracking and validation
- Regional aggregation
- Service-level reporting support
