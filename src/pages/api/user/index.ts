import type { NextApiRequest, NextApiResponse } from 'next';
import { PrismaClient } from '@prisma/client';
import { ModelUser } from '@/model_service/user.model.service';




const prisma = new PrismaClient()


export default async function user(req: NextApiRequest, res: NextApiResponse) {
  const { method, body } = req;

  try {
    if (method === 'GET') {
      let user = new ModelUser(res);
      const response = await user.getAll()
      res.json(response);

    } else if (method === 'POST') {
      let user = new ModelUser(res);
      const response = await user.add(body);
      res.json(response);

    } else {
      res.status(404).send("Not Found");
    }

  } catch (e) {
    res.status(500).send("Internal Server Error");
  };
}
