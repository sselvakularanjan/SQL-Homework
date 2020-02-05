CREATE TABLE "Card_Holder" (
    "card_holder_id" int   NOT NULL,
    "card_holder_name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_Card_Holder" PRIMARY KEY (
        "card_holder_id"
     )
);

CREATE TABLE "Credit_Card" (
    "credit_card_number" int   NOT NULL,
    "card_holder_id" int   NOT NULL,
    CONSTRAINT "pk_Credit_Card" PRIMARY KEY (
        "credit_card_number"
     )
);

CREATE TABLE "Merchant_Category" (
    "merchant_category_id" int   NOT NULL,
    "merchant_category_name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_Merchant_Category" PRIMARY KEY (
        "merchant_category_id"
     )
);

CREATE TABLE "Merchant" (
    "merchant_id" int   NOT NULL,
    "merchant_name" varchar(200)   NOT NULL,
    "merchant_category_id" int   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "merchant_id"
     )
);

CREATE TABLE "Transaction" (
    "transaction_id" int   NOT NULL,
    "transaction_date" date   NOT NULL,
    "transaction_amount" float   NOT NULL,
    "merchant_id" int   NOT NULL,
    "credit_card_number" int   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "transaction_id"
     )
);

ALTER TABLE "Credit_Card" ADD CONSTRAINT "fk_Credit_Card_card_holder_id" FOREIGN KEY("card_holder_id")
REFERENCES "Card_Holder" ("card_holder_id");

ALTER TABLE "Merchant" ADD CONSTRAINT "fk_Merchant_merchant_category_id" FOREIGN KEY("merchant_category_id")
REFERENCES "Merchant_Category" ("merchant_category_id");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "Merchant" ("merchant_id");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_credit_card_number" FOREIGN KEY("credit_card_number")
REFERENCES "Credit_Card" ("credit_card_number");
