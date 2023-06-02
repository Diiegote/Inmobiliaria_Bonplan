import type { NextApiRequest, NextApiResponse } from 'next';
import { PrismaClient } from '@prisma/client';
import { ModelUser } from '@/model_service/user.model.service';



export default async function user(req: NextApiRequest, res: NextApiResponse) {
  const { id } = req.query;
  const { method, body } = req;
  const Id = Number(id);

  try {

    if (method === "GET") {
      let user = new ModelUser(res);
      const response = await user.getOne(Id);
      res.send(response);
    }

    else if (method === "PUT") {

      let user = new ModelUser(res);
      const response = await user.update(Id, body);
      res.send(response);

    }

    else if (method === 'DELETE') {

      let user = new ModelUser(res);
      const response = await user.delete(Id);
      res.send(response);
    }

    else {

      res.status(404).json({ mesagge: "No se encontro la ruta" });
    }

  } catch (error: any) {
    res.status(404).json(error.message);
  };
};


