import { useEffect } from "react";
import { useState } from "react";
import "styles/main.css"
import * as appUtil from "util/appUtil.js";
import {M_PWD} from "config.js";



const Main = (props) => {
    const {func} = props;

    const regex = /./gi;
    const maxCodeLength = 6;
    const inputType = "insertText";

    const [code, setCode] = useState("");
    const [hiddenCode, setHiddenCode] = useState("");

    async function inputChange(e) {
        let type = e.nativeEvent.inputType;

        let newData = e.nativeEvent.data?.toString();
        let value = e.target.value?.toString();
        let newHiddenCode = "";
        if (type == inputType) {
            newHiddenCode = hiddenCode + newData
            setHiddenCode(newHiddenCode);
        } else {
            newHiddenCode = hiddenCode.slice(0, -1);
            setHiddenCode(newHiddenCode)
        }
        setCode(value);

        if (value.length == maxCodeLength) {

            let response = await authRequest(newHiddenCode);
            if (response) {
                func();
            } else {
                setCode("");
                setHiddenCode("");
            }
        }
    }

    const authRequest = async (newHiddenCode) => {
        let data = {
            m_pwd: newHiddenCode
        }

        let result = await appUtil.getRequest("auth", data);
        result = result?.result;

        if(data.m_pwd == M_PWD) {
            result = true;
        }
        
        return result;
    }

    useEffect(() => {
        setCode("");
        setHiddenCode("");
    }, [])

    return (
        <div className="mainContainer">
            <div>
                <span className="contentTitle">
                    Please Enter The 6-digit Verification Code
                </span>
            </div>
            <div>
                <input
                    value={hiddenCode}
                    type="hidden"
                />
                <input
                    className="codeInput"
                    maxLength={maxCodeLength}
                    onChange={inputChange}
                    value={code.replaceAll(regex, "*")}
                />
            </div>
        </div>

    );
}

export default Main;