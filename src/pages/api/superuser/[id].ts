import { ModelUser } from "@/model_service/user.model.service";
import { NextApiRequest, NextApiResponse } from "next";


export default async function changePasswod({ method, body, query }: NextApiRequest, res: NextApiResponse) {

   const { id } = query;
   const Id = Number(id);

   try {

      if (method === "PUT") {
        let user = new ModelUser(res);
        const response = await user.updatesuperuser(Id,body);
        res.send(response);
      }
      else {
  
        res.status(404).json({ mesagge: "Not Found" });
      }
  
    } catch (error: any) {
      res.status(404).json(error.message);
    };
}