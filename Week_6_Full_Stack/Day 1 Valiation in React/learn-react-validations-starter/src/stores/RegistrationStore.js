class RegistrationStore{
  constructor(){
    this.fields = {
      firstName:'',
      lastName:'',
      email:'',
      password:''
    }
    this.errors = {}
  }

  getFields(){
    return this.fields
  }

  getErrors(){
    // {}
    // or
    // {firstName: 'is requires'}
    return this.errors

  }

  validate(){
    this.errors = {}
    this.validatePresence('firstName')
    this.validatePresence('lastName')
    this.validatePassword('password')
    this.validatePassDigit('password')
    this.validatePassLetter('password')
    this.validatePassSpecial('password')
    this.validateEmail('email')

  }

  validatePresence(fieldName){
    if(this.fields[fieldName] === ''){
      this.addError(fieldName, 'is Required')
    }
  }

  validatePassword(fieldName){
      if(this.fields[fieldName].length <= 7 ){
      this.addError(fieldName, 'PW must be atleast 8 characters')
  }
}
  validatePassDigit(fieldName){
      if(this.fields[fieldName].search (/\d/) == -1){
      this.addError(fieldName, 'PW must include a number')
  }
}
  validatePassLetter(fieldName){
  if (this.fields[fieldName].search (/[a-zA-Z]/) == -1){
      this.addError(fieldName, 'PW must include at least one letter')
  }
}
  validatePassSpecial(fieldName){
  if (this.fields[fieldName].search (/[!@#$%^&*()_+]/) == -1){
      this.addError(fieldName, 'PW must include atleast one special character: !@#$%^&*()_+')
  }
}

  validateEmail(fieldName){
    const filter = /^\w+([\.-]?\ w+)*@\w+([\.-]?\ w+)*(\.\w{2,3})+$/
    if(!filter.test(this.fields[fieldName])){
      this.addError(fieldName, 'is not an email')
    }
  }

  addError(fieldName, message){
      if(this.errors[fieldName]){
        this.errors[fieldName].push(message)
    } else{
        this.errors[fieldName] = [message]
    }
  }
}

const store = new RegistrationStore()
export default store
