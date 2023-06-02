import { PrismaClient } from "@prisma/client";
import { NextApiRequest, NextApiResponse } from "next";


const prisma = new PrismaClient();

// eslint-disable-next-line import/no-anonymous-default-export
export default async function (req: NextApiRequest, res: NextApiResponse) {
   const { id } = req.query;
   const { method } = req;
   const Id = Number(id);
   try {
      switch (method) {
         case "GET":
            const ciudad = await prisma.city.findUnique({
               where: { id: Id }
            });
            if (ciudad) {
               return res.json(ciudad);
            } else {
               return res.status(404).json({ message: "No se encontro el id" })
            }

         case "PUT":
            return res.json({ message: "Se Edito Correctamente" })

         case "DELETE":
            res.json({ message: "Se Elimino Correctamente" });

         default:
            res.status(400).json({ message: "No se encontro la ruta" });
      };
   } catch (error) {
      console.log(error);
   };
};