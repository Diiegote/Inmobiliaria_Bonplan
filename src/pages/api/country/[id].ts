import { PrismaClient } from "@prisma/client";
import { NextApiRequest, NextApiResponse } from "next";


const prisma = new PrismaClient();

/* eslint-disable import/no-anonymous-default-export */
export default async function (req: NextApiRequest, res: NextApiResponse) {
   const { id } = req.query
   const { method } = req
   const Id = Number(id)
   try {
      switch (method) {
         case "GET":
            const ciudad = await prisma.country.findUnique({
               where: { id: Id }
            })
            if (ciudad) {
               return res.json(ciudad);
            } else {
               return res.status(400).json({ message: "Invalid id" });
            }
         case "PUT":
            return res.json({ message: "Se Edito Correctamente" })

         case "DELETE":
            return res.json({ message: "Se Elimino Correctamente" })
            
         default:
            res.status(400).json({ message: "No se encontro la ruta" });
      }
   } catch (error) {
      console.log(error)
   }
}