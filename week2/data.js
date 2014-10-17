var COUNT=10000;
var name="정호영고예찬고형진김기렴김다혜김정봉김중일김학결류선박성호" 
+"박찬진박태준배철오서재원선승현손명준심보희우지윤윤영기이경륜이도형"
+"이도호이재봉임은주정원철조부용조영대조유리조현호주혜연차용빈최승희"
+"최종혁최훈존하태호";
var choice = function(list) {
	var len = list.length;
	var r = parseInt(Math.random() * len);
	return list[r];
}

var getName = function() {
	var ret="";
	for (var i = 0; i < 3; i++) {
		ret = ret.concat(choice(name));
	}
	return ret;
}

var getGrade = function() {
	var grade="DPGSBU";
	var i = parseInt(Math.random() * grade.length);
	return grade[i];
}

var getMoney = function() {
	var unit = 100;
	var max = 100;
	return parseInt(Math.random() * max) * unit;
}

/*
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| id    | char(4) | NO   | PRI | NULL    |       |
| name  | char(8) | YES  |     | NULL    |       |
| grade | char(1) | YES  |     | NULL    |       |
| money | int(11) | YES  |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
*/
for (var i = 1; i <= COUNT; i++) {
	console.log(i + "," + getName() +"," + getGrade() + "," + getMoney());
}
