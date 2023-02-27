import { PrismaClient } from "@prisma/client";

let prisma = new PrismaClient();

// Prevent multiple instances of Prisma Client in development
export const getPrismaClient = (): PrismaClient => {
  if (!prisma) {
    prisma = new PrismaClient();
  }
  return prisma;
};

// Close the database connection when the server shuts down
// (e.g. via a SIGINT signal)
prisma.$on("beforeExit", async () => {
  console.log("beforeExit hook - Shutting down server");
  await prisma.$disconnect();
});
