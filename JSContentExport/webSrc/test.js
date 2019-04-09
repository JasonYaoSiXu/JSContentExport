function runNative() {
	//本地调用
         try{
//             console.log(11111111 + pkgMgrNativeApi + "=="+pkgMgrNativeApi.pkgMgrNativeApi);
             console.log(pkgMgrNativeApi);
            if(!pkgMgrNativeApi || !pkgMgrNativeApi.pkgMgrNativeApi){
                var rsp = {ret:"pkgMgrNativeApi not exist",readon:err.message};
                // JS_taskResultBackToJs(req.userHandle,JSON.stringify(rsp));
                console.log(rsp);
                return;
            }
             console.log(3);
            pkgMgrNativeApi.pkgMgrNativeApi("quwyequwyei");
             pkgMgrNativeApi.pkgMgrNativeApi1(10);
            console.log(2);
         }catch(err){
             var rsp = {ret:"pkgMgrNativeApi call fail",readon:err.message+ "  " + err.stack};
             console.log(rsp);
             // JS_taskResultBackToJs(req.userHandle,JSON.stringify(rsp));
         }
}

function alertMessage(message) {
    alert(message);
    return "asdasd";
}
