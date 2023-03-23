import { PrismaClient } from "@prisma/client";
import { NextApiRequest, NextApiResponse } from "next";


const prisma = new PrismaClient();

export default async function state(req: NextApiRequest, res: NextApiResponse) {
   const { method } = req;

   try {
      switch (method) {
         case "GET":
            const response = await prisma.state.findMany()
            return res.json(response)

         case "POST":
            return res.json({ message: "State creado correcamente" })

         default:
            res.status(400).json({ message: "Ruta no encontrada" })
      }
   } catch (error) {
      console.log(error)
   }

}