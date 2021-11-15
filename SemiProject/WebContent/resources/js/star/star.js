/*별점 : .star-input*/
/*출처 : http://codepen.io/naradesign/pen/zxPbOw*/
var starRating = function(){
var $star = $(".star-input"),
    $result = $star.find("output>b");
	
  	$(document)
	.on("focusin", ".star-input>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star-input>.input", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("focus");
     	 	}
   		}, 100);
 	 })
  
    .on("change", ".star-input :radio", function(){
    	$result.text($(this).next().text());
  	})
    .on("mouseover", ".star-input label", function(){
    	$result.text($(this).text());
    })
    .on("mouseleave", ".star-input>.input", function(){
    	var $checked = $star.find(":checked");
    		if($checked.length === 0){
     	 		$result.text("0");
   		 	} else {
     	 		$result.text($checked.next().text());
    		}
  	});
};

starRating();

var starScore = function(){
var $rStar = $(".rstarScore"),
    $rResult = $rStar.find("output>b");
	
  	$(document)
	.on("focusin", ".rstarScore>.score", 
		function(){
   		 $(this).addClass("starFocus");
 	})
		 
   	.on("focusout", ".rstarScore>.score", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("starFocus");
     	 	}
   		}, 100);
 	 })
  
    .on("change", ".rstarScore :radio", function(){
    	$rResult.text($(this).next().text());
  	})
    .on("mouseover", ".rstarScore label", function(){
    	$rResult.text($(this).text());
    })
    .on("mouseleave", ".rstarScore>.score", function(){
    	var $checked = $rStar.find(":checked");
    		if($checked.length === 0){
    			$rResult.text("0");
   		 	} else {
   		 		$rResult.text($checked.next().text());
    		}
    		
  	});
};

starScore();

