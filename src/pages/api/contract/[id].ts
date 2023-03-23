import { PrismaClient } from "@prisma/client";
import { NextApiRequest, NextApiResponse } from "next";


const prisma = new PrismaClient();


// eslint-disable-next-line import/no-anonymous-default-export
export default async function (req: NextApiRequest, res: NextApiResponse) {
   const { method } = req;
   const { id } = req.query;
   const Id = Number(id);

   try {
      switch (method) {
         case "GET":

            const contrato = await prisma.contract.findUnique({
               where: {
                  id: Id,
               }
            })
            if (contrato) {
               return res.json(contrato);
            } else {
               res.status(404).json({ message: "No se encontro el ID" })
            }

         case "PUT":
            return res.json({ message: "Se Edito Correctamente" });

         case "DELETE":
            return res.json({ message: "Se Elimino Correctamente" });

         default:
            res.status(400).json({ Message: "No se encontro la ruta" });
      }

   } catch (error) {
      console.log(error)
   }
}