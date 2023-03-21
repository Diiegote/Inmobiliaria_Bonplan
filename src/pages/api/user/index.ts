import type { NextApiRequest, NextApiResponse } from 'next'
import { PrismaClient } from '@prisma/client'

//  type Data = {
//    name: string
//  }
const prisma = new PrismaClient({ log: ['query', 'info'] })


export default async function handler(req: NextApiRequest, res: NextApiResponse) {

  const { method } = req

  try {
    switch (method) {
      case "GET":
        const user = await prisma.user.findMany()
        res.json(user)

      case "POST":
        return res.json({ mesagge: "Se Creo correctamente" })

      default:
        res.status(404).json({ mesagge: "No se encontro la ruta" })
    }
  } catch (error) {
    console.log(error)
  }
}