import type { NextApiRequest, NextApiResponse } from 'next'
import { PrismaClient } from '@prisma/client'

// type Data = {
//   name: string
// }
const prisma = new PrismaClient({ log: ['query', 'info'] })


export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const { id } = req.query
  const { method } = req
  const Id = Number(id);
  try {
    switch (method) {
      case "GET":
        const user = await prisma.user.findUnique({
          where: { id: Id }
        })
       if(user){
        return res.json(user)
       } else {
        res.status(400).json({message:"No se encontro el usuario"})
       }

      case "PUT":
        return res.json({ mesagge: "Se edito correctamente" })

      case "DELETE":
        return res.json({ mesagge: "Se Borro correctamente" })

      default:
        res.status(404).json({ mesagge: "No se encontro la ruta" })
    }
  } catch (error) {
    console.log(error)
  }
}
