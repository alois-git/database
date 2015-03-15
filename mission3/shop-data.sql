INSERT INTO clients ("client#", "cname", "groups")
VALUES
  (1, 'Jones', 'customer, employee'),
  (2, 'Smith', 'customer'),
  (3, 'Blake', 'customer, frequent shopper')
;

INSERT INTO products ("product#", "pname")
VALUES
  (1, 'Shirt'),
  (2, 'Book'),
  (3, 'iPad'),
  (4, 'Guitar'),
  (5, 'Computer')
;

INSERT INTO orders ("order#", "client#", "orderDate", "orderTotal")
VALUES
  (1, 1, '2015-03-01T08:00', 1230.0),
  (2, 2, '2015-03-02T12:00', 35.0),
  (3, 2, '2015-03-02T14:11', 546.0),
  (4, 3, '2015-03-04T21:54', 70.0)
;

INSERT INTO orderlines ("orderline#", "order#", "product#", "qty", "price")
VALUES
  (1, 1, 2, 2, 65.00),
  (2, 1, 5, 1, 1200.00),
  (3, 2, 1, 1, 35.00),
  (4, 3, 4, 1, 546.00),
  (5, 4, 1, 2, 35.00)
;

INSERT INTO promotions ("promo#", "orderline#", "order#", "promoType", "promoAmount")
VALUES
  (1, 2, 1, 'discount', 100.00),
  (2, 5, 4, 'discount', 5.00),
  (3, 5, 4, 'special', 10.0)
;
