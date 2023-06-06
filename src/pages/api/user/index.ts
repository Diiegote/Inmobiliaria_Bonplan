import type { NextApiRequest, NextApiResponse } from 'next';
import { ModelUser } from '@/model_service/user.model.service';




export default async function user({body,method}: NextApiRequest, res: NextApiResponse) {

  try {
    if (method === 'GET') {
      let user = new ModelUser(res);
      const response = await user.getAll()
      res.send(response);

    } else if (method === 'POST') {
      let user = new ModelUser(res);
      const response = await user.add(body);
      res.send({Message:"User Created",response});

    } else {
      res.status(404).send("Not Found");
    }

  } catch (e) {
    res.status(500).send("Internal Server Error");
  };
}
