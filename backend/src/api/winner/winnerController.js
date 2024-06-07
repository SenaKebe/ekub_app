import { prisma } from "../../config/prisma.js";
import  winnerSchema  from "./winnerSchema.js";


const winnerController = {
  register: async (req, res, next) => {
    try {
      const data = winnerSchema.register.parse(req.body);

      const isLotExist = await prisma.lots.findFirst({
        where: {
          id: data.lotId,
        },
      });

      if (!isLotExist) {
        return res.status(404).json({
          success: false,
          message: "Lot not found",
        });
      }
      // Check if the winner is registered before
      const isWinnerExist = await prisma.winners.findFirst({
        where: {
          lotId: data.lotId,
        },
      });

      if (isWinnerExist) {
        return res.status(404).json({
          success: false,
          message: "Winner is already registered",
        });
      }

      const newWinner = await prisma.winners.create({
        data: {
          lotId: data.lotId,
          registeredBy: req.user.id,
        },
      });

      return res.status(200).json({
        success: true,
        message: "Winner registered successfully",
        data: newWinner,
      });
    } catch (error) {
      next(error);
    }
  },

  update: async (req, res, next) => {
    try {
        const id = parseInt(req.params.id.substring(1));
      const data = winnerSchema.update.parse(req.body);

      // Check if the winner exists
      const isWinnerExist = await prisma.winners.findFirst({
        where: {
          id: id,
        },
      });

      if (!isWinnerExist) {
        return res.status(404).json({
          success: false,
          message: "Winner not found",
        });
      }

      const updatedWinner = await prisma.winners.update({
        where: {
          id: id,
        },
        data: {
          lotId: data.lotId,
          registeredBy: req.user.id,
        },
      });

      return res.status(200).json({
        success: true,
        message: "Winner updated successfully",
        data: updatedWinner
      });
    } catch (error) {
      next(error);
    }
  },
  updateLoanStatus : async (req, res, next) => {
    const id = parseInt(req.params.id.substring(1));
  
    try {
      const existingLoan = await prisma.loans.findUnique({
        where: { id: id },
      });
  
      if (!existingLoan) {
        return res.status(404).json({
          success: false,
          message: 'Loan not found',
        });
      }
  
      const updatedLoan = await prisma.loans.update({
        where: { id: parseInt(id) },
        data: {
          isPaidBack: true,
        },
      });
  
      return res.status(200).json({
        success: true,
        message: 'Loan status updated to paid back',
        data: updatedLoan,
      });
    } catch (error) {
      next(error);
    }
  },



  

  delete: async (req, res, next) => {
    try {
        const id = parseInt(req.params.id.substring(1));

      // Check if the winner exists
      const isWinnerExist = await prisma.winners.findFirst({
        where: {
          id: id,
        },
      });

      if (!isWinnerExist) {
        return res.status(404).json({
          success: false,
          message: "Winner not found",
        });
      }

      await prisma.winners.delete({
        where: {
          id: id,
        },
      });

      return res.status(200).json({
        success: true,
        message: 'Winner deleted successfully',
      });
    } catch (error) {
      next(error);
    }
  },
  getSingleWinner: async (req, res, next) => {
    try {
      const id = parseInt(req.params.id.substring(1), 10);
      if (isNaN(id)) {
        return res.status(400).json({
          success: false,
          message: 'Invalid winner ID specified',
        });
      }

      const winner = await prisma.winners.findUnique({
        where: {
          id: id,
        },
      });

      if (!winner) {
        return res.status(404).json({
          success: false,
          message: 'Winner not found',
        });
      }

      return res.status(200).json({
        success: true,
        message: 'Winner retrieved successfully',
        data: winner,
      });
    } catch (error) {
      next(error);
    }
  },
  getAllWinners: async (req, res, next) => {
    try {
      const winners = await prisma.winners.findMany();

      return res.status(200).json({
        success: true,
        message: 'All winners retrieved successfully',
        data: winners,
      });
    } catch (error) {
      next(error);
    }
  },
}



;

export default winnerController;
