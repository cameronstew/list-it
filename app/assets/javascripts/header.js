  $(function(){
      var colors = ["#f83d62", "#fe7f1b", "#ba66b2", "#dde61a", "#1bb642", "#31a1db", "#ff1d8e"],
      selectedColor = colors[Math.floor(Math.random()*colors.length)]
      header = $(".color-me");
      header.css("background-color", selectedColor);
  });
