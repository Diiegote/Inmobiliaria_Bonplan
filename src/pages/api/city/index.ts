import { PrismaClient } from "@prisma/client";
import { NextApiRequest, NextApiResponse } from "next";

const prisma = new PrismaClient();

// eslint-disable-next-line import/no-anonymous-default-export
export default async function (req: NextApiRequest, res: NextApiResponse) {
   const { method } = req;
   try {
      switch (method) {
         case 'GET':
            const ciudades = await prisma.city.findMany();
           return res.json(ciudades);
         default:
            res.status(404).json({message:'No se encontro la ruta'});
      }
   } catch (error) {
      console.log(error);
   };
};

