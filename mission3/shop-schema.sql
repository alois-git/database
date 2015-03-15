DROP DATABASE IF EXISTS lingi2172_shop;

CREATE DATABASE lingi2172_shop OWNER lingi2172;

\c lingi2172_shop

CREATE TABLE clients (
  "client#"     SERIAL        NOT NULL PRIMARY KEY,
  "cname"       VARCHAR(255)  NOT NULL,
  "groups"      TEXT          NOT NULL
);
COMMENT ON TABLE clients IS '
Client `client#` is called `cname` and belongs to the groups of
clients indicated in `groups` (i.e. employees, frequent shopper
or simply customer)
';

CREATE TABLE products (
  "product#"    SERIAL        NOT NULL PRIMARY KEY,
  "pname"       VARCHAR(255)  NOT NULL
);
COMMENT ON TABLE products IS '
Product `product#` is named `pname`
';

CREATE TABLE orders (
  "order#"      SERIAL        NOT NULL PRIMARY KEY,
  "client#"     INTEGER       NOT NULL REFERENCES clients ("client#"),
  "orderDate"   TIMESTAMP     NOT NULL,
  "orderTotal"  DECIMAL(10,4) NOT NULL
);
COMMENT ON TABLE orders IS '
Order n° `order#` has been sent on `orderDate` by client `client#`
and amounts for a total of `orderTotal` euros, all taxes included
';

CREATE TABLE orderlines (
  "orderline#"  SERIAL        NOT NULL PRIMARY KEY,
  "order#"      INTEGER       NOT NULL REFERENCES orders ("order#"),
  "product#"    INTEGER       NOT NULL REFERENCES products ("product#"),
  "qty"         INTEGER       NOT NULL,
  "price"       DECIMAL(10,4) NOT NULL
);
COMMENT ON TABLE orderlines IS '
Order line `orderline#` belongs to order n° `order#`. It covers the ordering
of `qty` amount of product n° `product#`, one unity of which having cost `price`
';

CREATE TYPE PROMOTYPE AS ENUM ('discount', 'special');
COMMENT ON TYPE PROMOTYPE IS '
We distinguish two types of promotions only: discount and special promo.
The special promo is typically used for employees and frequent shoppers, yet
not always or systematically.
';

CREATE TABLE promotions (
  "promo#"      SERIAL        NOT NULL PRIMARY KEY,
  "orderline#"  INTEGER       NOT NULL REFERENCES orderlines ("orderline#"),
  "order#"      INTEGER       NOT NULL REFERENCES orders ("order#"),
  "promoType"   PROMOTYPE     NOT NULL,
  "promoAmount" DECIMAL(10,4) NOT NULL
);
COMMENT ON TABLE promotions IS '
Promotion n° `promo#` is for order line n° `orderline#`, which belongs to order n°
`order#`. It is a `promoType` promotion for a total amount of `promoAmount` for that
order line (i.e. it is not a per product promotion).
';
