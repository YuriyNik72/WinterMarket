
DROP TABLE IF EXISTS users cascade ;

CREATE TABLE users (
           id                    bigserial  primary key,
           username              VARCHAR (50) NOT NULL,
           password              VARCHAR (80) NOT NULL,
           first_name            VARCHAR (50) NOT NULL,
           last_name             VARCHAR (50) NOT NULL,
           email                 VARCHAR (50) NOT NULL
--            phone                 VARCHAR (15) NOT NULL
);

DROP TABLE IF EXISTS roles cascade ;

CREATE TABLE roles (
           id                    bigserial  primary key,
           name                  VARCHAR(50) DEFAULT NULL
);

DROP TABLE IF EXISTS users_roles cascade ;

CREATE TABLE users_roles (
         user_id               bigserial  NOT NULL,
         role_id               bigserial  NOT NULL,
         PRIMARY KEY (user_id,role_id),

--  KEY FK_ROLE_idx (role_id),

         CONSTRAINT FK_USER_ID_01 FOREIGN KEY (user_id)
             REFERENCES users (id)
             ON DELETE NO ACTION ON UPDATE NO ACTION,

         CONSTRAINT FK_ROLE_ID FOREIGN KEY (role_id)
             REFERENCES roles (id)
             ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS categories cascade ;

CREATE TABLE categories (
            id	                bigserial  primary key,
            title                 VARCHAR(255)
--                 NOT NULL
                        ,
            description           VARCHAR(5000)
);

DROP TABLE IF EXISTS products cascade ;

CREATE TABLE products (
              id	                bigserial  primary key,
              category_id           integer NOT NULL,
              vendor_code           VARCHAR(8) NOT NULL,
              title                 VARCHAR(255) NOT NULL,
              short_description     VARCHAR(1000) NOT NULL,
              full_description      VARCHAR(5000) NOT NULL,
              price                 DECIMAL(8,2) NOT NULL,
              create_at             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
              update_at             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
              CONSTRAINT FK_CATEGORY_ID FOREIGN KEY (category_id)
              REFERENCES categories (id)
);

DROP TABLE IF EXISTS products_images cascade ;

CREATE TABLE products_images (
             id                    bigserial  primary key,
             product_id            INTEGER NOT NULL,
             path                  VARCHAR(250) NOT NULL,
             CONSTRAINT FK_PRODUCT_ID_IMG FOREIGN KEY (product_id)
             REFERENCES products (id)
);

DROP TABLE IF EXISTS orders_statuses cascade;

CREATE TABLE orders_statuses (
             id                    bigserial  primary key,
             title                 VARCHAR(50) DEFAULT NULL
);

DROP TABLE IF EXISTS delivery_addresses cascade;

CREATE TABLE delivery_addresses (
            id	                  bigserial,
            user_id               INTEGER NOT NULL,
            address               VARCHAR(500) NOT NULL,
            PRIMARY KEY (id),
            CONSTRAINT FK_USER_ID_DEL_ADR FOREIGN KEY (user_id)
                REFERENCES users (id)
);

DROP TABLE IF EXISTS orders cascade;

CREATE TABLE orders (
            id	                  bigserial,
            user_id               INTEGER NOT NULL,
            price                 DECIMAL(8,2) NOT NULL,
            delivery_price        DECIMAL(8,2) NOT NULL,
            delivery_address_id   INTEGER NOT NULL,
            phone_number          VARCHAR(20) NOT NULL,
            status_id             INTEGER NOT NULL,
            delivery_date         TIMESTAMP NOT NULL,
            create_at             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            update_at             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            CONSTRAINT FK_USER_ID FOREIGN KEY (user_id)
                REFERENCES users (id),
            CONSTRAINT FK_STATUS_ID FOREIGN KEY (status_id)
                REFERENCES orders_statuses (id),
            CONSTRAINT FK_DELIVERY_ADDRESS_ID FOREIGN KEY (delivery_address_id)
                REFERENCES delivery_addresses (id)
);

DROP TABLE IF EXISTS orders_item cascade;

CREATE TABLE orders_item (
             id	                   bigserial,
             product_id            INTEGER NOT NULL,
             order_id              INTEGER NOT NULL,
             quantity              INT NOT NULL,
             item_price            DECIMAL(8,2) NOT NULL,
             total_price           DECIMAL(8,2) NOT NULL,
             PRIMARY KEY (id),
             CONSTRAINT FK_ORDER_ID FOREIGN KEY (order_id)
                 REFERENCES orders (id),
             CONSTRAINT FK_PRODUCT_ID_ORD_IT FOREIGN KEY (product_id)
                 REFERENCES products (id)
);

INSERT INTO roles (name)
VALUES
    ('ROLE_EMPLOYEE'), ('ROLE_MANAGER'), ('ROLE_ADMIN');

INSERT INTO users (username,password,first_name,last_name,email)
VALUES
    ('admin','$2a$10$IdWtA3RdhGyxqoHilueq.OziHZnO8slNkNF8pU4hK3v442U5AgSdm','Admin','Admin','admin@gmail.com');

INSERT INTO users_roles (user_id, role_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3);

INSERT INTO categories (title)
VALUES
    ('Телевизоры'), ('Ноутбуки');

INSERT INTO orders_statuses (title)
VALUES
    ('Сформирован');

INSERT INTO products (category_id, vendor_code, title, short_description, full_description, price)
VALUES
    (1, '00000001', '20" Телевизор Samsung UE20NU7170U', 'Коротко: Хороший телевизор Samsung 20', 'LED телевизор Samsung 20', 1.00),
    (1, '00000002', '24" Телевизор Samsung UE24NU7170U', 'Коротко: Хороший телевизор Samsung 24', 'LED телевизор Samsung 24', 2.00),
    (1, '00000003', '28" Телевизор Samsung UE28NU7170U', 'Коротко: Хороший телевизор Samsung 28', 'LED телевизор Samsung 28', 3.00),
    (1, '00000004', '32" Телевизор Samsung UE32NU7170U', 'Коротко: Хороший телевизор Samsung 32', 'LED телевизор Samsung 32', 4.00),
    (1, '00000005', '36" Телевизор Samsung UE36NU7170U', 'Коротко: Хороший телевизор Samsung 36', 'LED телевизор Samsung 36', 5.00),
    (1, '00000006', '40" Телевизор Samsung UE40NU7170U', 'Коротко: Хороший телевизор Samsung 40', 'LED телевизор Samsung 40', 6.00),
    (2, '00000007', 'Ноутбук 17"  Samsung UE7170U', 'Коротко: Хороший ноутбук Samsung 17" ', 'Ноутбук с LED подсветкой Samsung 17" ', 7.00),
    (1, '00000008', '48\" Телевизор Samsung UE48NU7170U', 'Коротко: Хороший телевизор Samsung 48', 'LED телевизор Samsung 48', 8.00)
--     (1, "00000009", "52\" Телевизор Samsung UE52NU7170U", "Коротко: Хороший телевизор Samsung 52", "LED телевизор Samsung 52", 9.00),
--     (1, "00000010", "56\" Телевизор Samsung UE56NU7170U", "Коротко: Хороший телевизор Samsung 56", "LED телевизор Samsung 56", 10.00),
--     (1, "00000011", "60\" Телевизор Samsung UE60NU7170U", "Коротко: Хороший телевизор Samsung 60", "LED телевизор Samsung 60", 11.00),
--     (1, "00000012", "64\" Телевизор Samsung UE64NU7170U", "Коротко: Хороший телевизор Samsung 64", "LED телевизор Samsung 64", 12.00)
     ;

INSERT INTO products_images (product_id, path)
VALUES
    (2, '2.jpg');

INSERT INTO delivery_addresses (user_id, address)
VALUES
    (1, '18a Diagon Alley'),
    (1, '4 Privet Drive');