/*
  Warnings:

  - You are about to drop the column `cumulativepayment` on the `lots` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `lots` DROP COLUMN `cumulativepayment`,
    ADD COLUMN `cumulativePayment` DECIMAL(65, 30) NOT NULL DEFAULT 0;
