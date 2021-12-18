-- CreateTable
CREATE TABLE "Vehicle" (
    "id" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    "make" TEXT NOT NULL,
    "model" TEXT NOT NULL,

    CONSTRAINT "Vehicle_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Vehicle_year_make_model_key" ON "Vehicle"("year", "make", "model");
