-- CreateTable
CREATE TABLE "Customer" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "zipcode" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "notes" TEXT NOT NULL,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Item" (
    "itemnum" SERIAL NOT NULL,
    "fulldesc" TEXT NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "Item_pkey" PRIMARY KEY ("itemnum")
);

-- CreateTable
CREATE TABLE "Tire" (
    "itemnum" INTEGER NOT NULL,
    "brand" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "size" TEXT NOT NULL,
    "servicedesc" TEXT NOT NULL,
    "warranty" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "price" MONEY NOT NULL,
    "quantity" INTEGER NOT NULL,

    CONSTRAINT "Tire_pkey" PRIMARY KEY ("itemnum")
);

-- CreateTable
CREATE TABLE "Rim" (
    "itemnum" INTEGER NOT NULL,
    "brand" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "size" TEXT NOT NULL,
    "boltpattern" TEXT NOT NULL,
    "finish" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "price" MONEY NOT NULL,
    "quantity" TEXT NOT NULL,

    CONSTRAINT "Rim_pkey" PRIMARY KEY ("itemnum")
);

-- CreateTable
CREATE TABLE "Part" (
    "itemnum" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "price" MONEY NOT NULL,

    CONSTRAINT "Part_pkey" PRIMARY KEY ("itemnum")
);

-- CreateTable
CREATE TABLE "Service" (
    "itemnum" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "price" MONEY NOT NULL,

    CONSTRAINT "Service_pkey" PRIMARY KEY ("itemnum")
);

-- CreateTable
CREATE TABLE "Package" (
    "itemnum" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "price" MONEY NOT NULL,

    CONSTRAINT "Package_pkey" PRIMARY KEY ("itemnum")
);

-- CreateTable
CREATE TABLE "Order" (
    "ordernum" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "cid" TEXT NOT NULL,
    "vid" TEXT NOT NULL,
    "odometer" INTEGER NOT NULL,
    "comments" TEXT NOT NULL,
    "subtotal" MONEY NOT NULL,
    "tax" MONEY NOT NULL,
    "total" MONEY NOT NULL,
    "paymethod" TEXT NOT NULL,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("ordernum")
);

-- CreateTable
CREATE TABLE "OrderItem" (
    "id" TEXT NOT NULL,
    "ordernum" INTEGER NOT NULL,
    "itemnum" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "amount" MONEY NOT NULL,
    "price" MONEY NOT NULL,

    CONSTRAINT "OrderItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Customer_name_phone_email_address_key" ON "Customer"("name", "phone", "email", "address");

-- AddForeignKey
ALTER TABLE "Tire" ADD CONSTRAINT "Tire_itemnum_fkey" FOREIGN KEY ("itemnum") REFERENCES "Item"("itemnum") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rim" ADD CONSTRAINT "Rim_itemnum_fkey" FOREIGN KEY ("itemnum") REFERENCES "Item"("itemnum") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Part" ADD CONSTRAINT "Part_itemnum_fkey" FOREIGN KEY ("itemnum") REFERENCES "Item"("itemnum") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_itemnum_fkey" FOREIGN KEY ("itemnum") REFERENCES "Item"("itemnum") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Package" ADD CONSTRAINT "Package_itemnum_fkey" FOREIGN KEY ("itemnum") REFERENCES "Item"("itemnum") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_cid_fkey" FOREIGN KEY ("cid") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_vid_fkey" FOREIGN KEY ("vid") REFERENCES "Vehicle"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_ordernum_fkey" FOREIGN KEY ("ordernum") REFERENCES "Order"("ordernum") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_itemnum_fkey" FOREIGN KEY ("itemnum") REFERENCES "Item"("itemnum") ON DELETE RESTRICT ON UPDATE CASCADE;
