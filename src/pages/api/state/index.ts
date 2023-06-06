import {Prisma} from '../../../utils/prismaclient';
import { NextApiRequest, NextApiResponse } from "next";



export default async function state(req: NextApiRequest, res: NextApiResponse) {
   const { method } = req;

   try {
      switch (method) {
         case "GET":
            const response = await Prisma.state.findMany()
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