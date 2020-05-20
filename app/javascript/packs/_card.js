const clickOnCard = () => {
  const motos = document.querySelectorAll('.card-moto');
  // console.log(motos);
  motos.forEach(moto => { 
    moto.addEventListener("click", (event) => {
      event.preventDefault();
      const url = moto.getElementsByTagName('a')[0].baseURI.slice(0, -1);
      const id = moto.getElementsByTagName('a')[0].pathname;
      // console.log(url);
      // console.log(id);
      window.location.replace(`${url}`+`${id}`);
    });
  });
};

export { clickOnCard };