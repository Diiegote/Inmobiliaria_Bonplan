import { PrismaClient } from "@prisma/client";
import { NextApiRequest, NextApiResponse } from "next";


const prisma = new PrismaClient();

// eslint-disable-next-line import/no-anonymous-default-export
export default async function (req: NextApiRequest, res: NextApiResponse) {
   const { method } = req;

   try {
      switch (method) {
         case "GET":
            const contrato = await prisma.contract.findMany();
            if (contrato) {
               res.json(contrato);
            } else {
               res.status(400).json({ message: "No se encontro el contrato" });
            }
         case "POST":
            res.json({ message: "Contrato creado correctamente" });

         default:
            res.status(400).json({ message: "No se encontro la ruta" });
      }
   } catch (error) {
      console.log(error)
   }
}