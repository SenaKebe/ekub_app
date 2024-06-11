/*
  Warnings:

  - You are about to drop the column `count` on the `loans` table. All the data in the column will be lost.
  - You are about to drop the column `count` on the `winners` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `loans` DROP COLUMN `count`;

-- AlterTable
ALTER TABLE `winners` DROP COLUMN `count`;
