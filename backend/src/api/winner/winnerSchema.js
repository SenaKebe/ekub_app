import { z } from 'zod';

const winnerSchema = {
  register: z.object({
    lotId: z.number().int().positive(),
  }),
  update: z.object({
    lotId: z.number().int().positive(),
  }),
};
export default winnerSchema