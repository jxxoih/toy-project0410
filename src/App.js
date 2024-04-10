import Main from "components/Main";
import Question from "components/Question";
import { useEffect, useState } from "react";

import "styles/common.css";

const keyName = "jiCertification";
const ADMIN_AUTHORITY_EXPIRE_TIME = 6000000; // 1시간


function App() {
  const [certification, setCertification] = useState(false);

  const certifiHandler = () => {
    setCertification(true);
    saveCertification();
  }

  const saveCertification = () => {
    const obj = {
      value: keyName,
      expire: Date.now() + ADMIN_AUTHORITY_EXPIRE_TIME
    }
    const objString = JSON.stringify(obj);

    window.localStorage.setItem(keyName, objString);

    return true;
  }

  const getCertification = () => {
    const objString = window.localStorage.getItem(keyName);

    if (!!!objString) {
      return false;
    }

    const obj = JSON.parse(objString);

    if (Date.now() > obj.expire) {
      window.localStorage.removeItem(keyName);

      return false;
    }

    return true;
  }

  useEffect(() => {
    setCertification(getCertification());
  }, []);

  return (
    <div className="App">
      {
        [!certification && (
          <Main
            func={certifiHandler}
          />
        ),
        certification && (
          <Question
          />
        )]
      }
    </div>
  );
}

export default App;
