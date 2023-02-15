validateMobile(String value) {
// Indian Mobile number are of 10 digit only

  if (RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
      .hasMatch(value)) {
    return true;
  } else if (value.length != 10) {
    return false;
  } else {
    return true;
  }
}
//  validateMobileNumber(mobileNumber) {
//   var pattern = /^\d{10}$/;
//   if (pattern.test(mobileNumber)) {
//     return true;
//   }
//   return false;
// }

validateEmail(String value) {
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

validateName(String value) {
  if (value.isEmpty) {
    return 'Required';
  } else {
    return "";
  }
}
