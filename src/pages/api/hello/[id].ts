import type { NextApiRequest, NextApiResponse } from 'next'
import { PrismaClient } from '@prisma/client'

// type Data = {
//   name: string
// }
const prisma = new PrismaClient({ log: ['query', 'info'] })


export default async function handler(req: NextApiRequest,res: NextApiResponse) {
  const bookId = Number(req.query.id);
  const user = await prisma.user.findUnique({
     where:{id:bookId} 
    })
  res.status(200).json(user)
}
