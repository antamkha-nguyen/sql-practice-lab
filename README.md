# SQL Practice Lab

A collection of SQL exercises using **PostgreSQL**, focused on relational database concepts, SQL querying and data retrieval through business scenarios.

## Tech Stack

- **Database:** PostgreSQL
- **Core Concepts:** Joins, Aggregations, Subqueries and Data Filtering

## 1. ZAGI Retail: Sales Database

### Business Context

ZAGI Retail is a fictional retail company that operates stores across multiple regions and sells products supplied by various vendors.

Its sales database tracks customers, products, product categories, vendors, store locations and sales transactions. The relational structure supports queries about product information, customer purchases, inventory categories and retail sales activity.

### Data Dictionary

The database consists of **8 relational tables**.

| Table | Primary Key | Description |
|---|---|---|
| `region` | `regionid` | Geographic regions in which stores operate |
| `store` | `storeid` | Store locations, ZIP codes and assigned regions |
| `customer` | `customerid` | Customer names and ZIP codes |
| `vendor` | `vendorid` | Suppliers providing retail products |
| `category` | `categoryid` | Product classifications |
| `product` | `productid` | Product names, prices, vendors and categories |
| `salestransaction` | `tid` | Sales transactions associated with customers, stores and dates |
| `soldvia` | `productid`, `tid` | Products and quantities associated with each transaction |

**Key Relationships**
- Each store belongs to a region.
- Each product belongs to a category and is associated with a vendor.
- Each sales transaction is associated with a customer and store.
- `soldvia` connects products with sales transactions and records the quantity purchased.

**ER Diagram**

<img width="600" height="670" alt="ZAGI_erd" src="https://github.com/user-attachments/assets/24b4dfd3-4249-4e56-9b95-33ad8b2d9201" />

---

## 2. HAFH Realty: Property Management Database

### Business Context

HAFH Realty is a fictional property management company responsible for managing residential buildings and apartments leased to corporate clients.

Its database organizes information about property managers, buildings, apartment units, corporate tenants, inspections and cleaning services.

The relational structure supports operational queries such as identifying available apartments, tracking inspection schedules, reviewing building assignments and determining which staff members provide cleaning services.

### Data Dictionary

The database consists of **9 relational tables**.

| Table | Primary Key | Description |
|---|---|---|
| `manager` | `managerid` | Manager information, including names, salary and building of residence |
| `managerphone` | `managerid`, `mphone` | Phone numbers associated with managers |
| `building` | `buildingid` | Buildings, floor counts and assigned managers |
| `inspector` | `insid` | Inspector identification and names |
| `inspecting` | `insid`, `buildingid` | Building inspections and inspection dates |
| `corpclient` | `ccid` | Corporate clients, industries, locations and referrals |
| `apartment` | `buildingid`, `aptno` | Apartment units, bedroom counts and corporate tenants |
| `staffmember` | `smemberid` | Staff identification and names |
| `cleaning` | `buildingid`, `aptno`, `smemberid` | Cleaning assignments linking staff members to apartment units |

**Key Relationships**
- Each building is assigned a manager.
- Apartments are identified by their building and apartment number.
- Corporate clients may lease apartments and refer other corporate clients.
- Inspectors are associated with buildings through inspection records.
- Cleaning assignments associate staff members with apartments.

**ER Diagram**

<img width="600" height="670" alt="HAFH_erd" src="https://github.com/user-attachments/assets/28825531-d3ac-4e43-9a82-7193319fe06b" />

---

## Repository Structure

```text
sql-practice-lab/
├── README.md
├── ZAGI-Retail/
│   ├── ZAGI_schema.sql
│   └── ZAGI_retail_dept.sql
└── HAFH-Realty/
    ├── HAFH_schema.sql
    └── HAFH_realty.sql
```

## Notes

These databases are educational case studies used for SQL practice. The repository contains database schema definitions and query exercises rather than production systems. The SQL schema files define the table structures but do not contain sample data. Query execution requires the corresponding database records.


