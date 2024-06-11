/*
  Warnings:

  - You are about to drop the column `remaining` on the `deposits` table. All the data in the column will be lost.
  - You are about to drop the column `isPaidBack` on the `loans` table. All the data in the column will be lost.
  - Added the required column `count` to the `Deposits` table without a default value. This is not possible if the table is not empty.
  - Added the required column `remainingAmountPerDeposit` to the `Deposits` table without a default value. This is not possible if the table is not empty.
  - Added the required column `remainingCommissionPerDeposit` to the `Deposits` table without a default value. This is not possible if the table is not empty.
  - Added the required column `count` to the `Loans` table without a default value. This is not possible if the table is not empty.
  - Added the required column `count` to the `Winners` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `category` ALTER COLUMN `collectionCycle` DROP DEFAULT,
    ALTER COLUMN `duration` DROP DEFAULT;

-- AlterTable
ALTER TABLE `deposits` DROP COLUMN `remaining`,
    ADD COLUMN `count` INTEGER NOT NULL,
    ADD COLUMN `remainingAmountPerDeposit` DECIMAL(65, 30) NOT NULL,
    ADD COLUMN `remainingCommissionPerDeposit` DECIMAL(65, 30) NOT NULL;

-- AlterTable
ALTER TABLE `loans` DROP COLUMN `isPaidBack`,
    ADD COLUMN `count` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `lots` ALTER COLUMN `remainingAmount` DROP DEFAULT;

-- AlterTable
ALTER TABLE `winners` ADD COLUMN `count` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `remainingPayement` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `lotId` INTEGER NOT NULL,
    `depositId` INTEGER NOT NULL,
    `amountPaid` DECIMAL(65, 30) NULL DEFAULT 0,
    `commissionPaid` DECIMAL(65, 30) NULL DEFAULT 0,
    `paymentDate` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `remainingPayement` ADD CONSTRAINT `remainingPayement_depositId_fkey` FOREIGN KEY (`depositId`) REFERENCES `Deposits`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `remainingPayement` ADD CONSTRAINT `remainingPayement_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `remainingPayement` ADD CONSTRAINT `remainingPayement_lotId_fkey` FOREIGN KEY (`lotId`) REFERENCES `Lots`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
