import axios from 'axios';
import {REQUEST_API_URL} from "config";

export const getRequest = async (action, arg) => {
    const data = {
        params: {
            arg: arg,
        }
    }

    return await axios.get(REQUEST_API_URL + action, data)
        .then((res) => 
            res.data
        )
        .catch((err) => console.log("err", err))
}