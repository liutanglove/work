$.extend($.fn.validatebox.defaults.rules, {   
    minL: {   
    	//每次输入都会回调此方法；value：用户输入的值   param：validType:'minL[2]'
        validator: function(value, param){  
        	console.log(value+" == "+param[0]);
            return value.length >= param[0];   
        },   
        //{0}指第一个参数的值：validType:'minL[2]'
        message: '密码至少为{0}位字符.'
    },
    eq: {   
        validator: function(value,param){   
            return value == $(param[0]).val();   
        },   
        message: 'Field do not match.'  
    },
    maxx:{
    	 validator: function(value,param){   
             return value.length<=param[0]
         },   
         message: 'Please enter at most {0} characters.'  
    }

});  
