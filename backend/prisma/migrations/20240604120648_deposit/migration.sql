/*
  Warnings:

  - Added the required column `count` to the `Deposits` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `deposits` ADD COLUMN `count` INTEGER NOT NULL;
