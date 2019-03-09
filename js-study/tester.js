const tester = (func, data, answer, msg="don't match") => {
  if(typeof func==="undefined" || typeof data==="undefined" || typeof answer==="undefined"){
      const confirm = (`
  => "func": ${func}
  => "data": ${data}
  => "answer": ${answer}
      `);
      throw new Error(`argument is missing! ${confirm}`);
  }
  if(func(data)!==answer){
      const result = func(data);
      const confirm = (`
  => correct: ${answer}
  => output: ${result}
      `);
      throw new Error(`${msg}! ${confirm}`);
  } else {
      console.log("GREEN: true");
      return true;
  }
}

const func = (num) => {
  return num +1;
}

const testData = 5
const resultData = 6

tester(func, testData, resultData+1);