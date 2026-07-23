# E-Commerce Database — ER Diagram & Relationship Guide

## Entity-Relationship Diagram (Mermaid)

```mermaid
erDiagram
    DEPARTMENTS ||--o{ EMPLOYEES : "employs"
    EMPLOYEES ||--o{ EMPLOYEES : "manages"
    EMPLOYEES ||--o{ ORDERS : "handled_by"

    CATEGORIES ||--o{ PRODUCTS : "classifies"
    SUPPLIERS ||--o{ PRODUCTS : "supplies"

    CUSTOMERS ||--o{ ORDERS : "places"
    SHIPPERS ||--o{ ORDERS : "delivers"
    COUPONS ||--o{ ORDERS : "applied_to"

    ORDERS ||--o{ ORDER_ITEMS : "contains"
    PRODUCTS ||--o{ ORDER_ITEMS : "included_in"

    ORDERS ||--o{ PAYMENTS : "paid_by"
    ORDERS ||--o{ RETURNS : "may_have"
    ORDER_ITEMS ||--o{ RETURNS : "returned_as"

    CUSTOMERS ||--o{ REVIEWS : "writes"
    PRODUCTS ||--o{ REVIEWS : "receives"

    WAREHOUSES ||--o{ INVENTORY : "stores"
    PRODUCTS ||--o{ INVENTORY : "stocked_as"

    DEPARTMENTS {
        int department_id PK
        string department_name
        decimal budget
        string location
    }
    EMPLOYEES {
        int employee_id PK
        string first_name
        string last_name
        string email
        date hire_date
        string job_title
        decimal salary
        int department_id FK
        int manager_id FK
    }
    CATEGORIES {
        int category_id PK
        string category_name
        string description
    }
    SUPPLIERS {
        int supplier_id PK
        string supplier_name
        string contact_name
        string city
        string country
        decimal rating
    }
    PRODUCTS {
        int product_id PK
        string product_name
        int category_id FK
        int supplier_id FK
        decimal price
        decimal cost
        boolean is_active
    }
    CUSTOMERS {
        int customer_id PK
        string first_name
        string last_name
        string email
        string city
        string country
        date signup_date
    }
    WAREHOUSES {
        int warehouse_id PK
        string warehouse_name
        string city
        int capacity
    }
    INVENTORY {
        int inventory_id PK
        int product_id FK
        int warehouse_id FK
        int quantity
        date last_restock_date
    }
    SHIPPERS {
        int shipper_id PK
        string shipper_name
        string phone
    }
    COUPONS {
        int coupon_id PK
        string coupon_code
        decimal discount_percent
        date valid_from
        date valid_to
    }
    ORDERS {
        int order_id PK
        int customer_id FK
        int employee_id FK
        int shipper_id FK
        int coupon_id FK
        datetime order_date
        string status
        decimal total_amount
    }
    ORDER_ITEMS {
        int order_item_id PK
        int order_id FK
        int product_id FK
        int quantity
        decimal unit_price
        decimal subtotal
    }
    PAYMENTS {
        int payment_id PK
        int order_id FK
        datetime payment_date
        decimal amount
        string payment_method
        string status
    }
    REVIEWS {
        int review_id PK
        int customer_id FK
        int product_id FK
        int rating
        string review_text
    }
    RETURNS {
        int return_id PK
        int order_id FK
        int order_item_id FK
        date return_date
        decimal refund_amount
        string status
    }
```

## Relationship Explanation

**Departments → Employees (1:N)**
Each department has many employees; each employee belongs to exactly one department (`ON DELETE CASCADE`).

**Employees → Employees (self-referencing, 1:N)**
`manager_id` references `employee_id` on the same table, modeling an organizational hierarchy. Top-level managers have `manager_id = NULL`. This is ideal for practicing **self joins** and **recursive CTEs**.

**Employees → Orders (1:N, nullable)**
An employee may process many orders; some orders have no assigned employee (self-checkout / online orders), hence `ON DELETE SET NULL`.

**Categories → Products (1:N)** and **Suppliers → Products (1:N)**
Every product belongs to exactly one category and is sourced from exactly one supplier. Deleting a category or supplier cascades to its products.

**Customers → Orders (1:N)**
A customer can place many orders. Deleting a customer cascades to their orders (simulating full account deletion / GDPR-style erasure).

**Shippers → Orders (1:N, nullable)** and **Coupons → Orders (1:N, nullable)**
An order is shipped by at most one shipper and may optionally use one coupon.

**Orders ↔ Products via Order_Items (M:N)**
`Order_Items` is the classic associative/junction table resolving the many-to-many relationship between orders and products, storing the quantity and price at time of sale.

**Orders → Payments (1:N)**
Each order has at least one payment record (supports retries/partial payments in real systems).

**Orders / Order_Items → Returns (1:N)**
A return always references both the parent order and the specific line item being returned.

**Customers ↔ Products via Reviews (M:N)**
Reviews link a customer's opinion to a specific product; a customer can review many products and a product can have many reviews.

**Warehouses ↔ Products via Inventory (M:N in general, 1:1 in this dataset)**
Inventory tracks stock quantity per product per warehouse. In this generated dataset each product is stocked in exactly one warehouse (enforced by a UNIQUE key on `product_id, warehouse_id`), but the schema supports multi-warehouse stocking.

## Normalization Notes
- All tables are in **3NF**: every non-key attribute depends on the whole primary key and nothing but the key.
- Derived/redundant data is minimized — `Orders.total_amount` is the only intentionally denormalized column (kept for query-performance practice and to mirror real-world order tables), and it is kept in sync via the `sp_place_order_item` stored procedure and can be recomputed via `SUM(Order_Items.subtotal)`.
- Composite uniqueness (`Inventory.product_id + warehouse_id`) prevents duplicate stock rows.
