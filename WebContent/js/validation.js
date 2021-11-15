/**
 * 
 */
String.prototype.validationPW = function(){
	// 8~20글자의 영문 대소문자, 숫자, 특수문자이고
	// 1개 이상의 특수문자 또는 숫자를 포함하는지 체크하는 정규식
	return /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$/.test(this);
}