import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const durationDates = (dates) => {
  if (dates.length === 1) {return};

  const duration = dates[1].getTime() - dates[0].getTime();
  const durationDays = 1 + Math.ceil(duration / (60 * 60 * 24 * 1000));
  const priceDayElement = document.querySelector('.price-tag');
  const priceDay = parseInt(priceDayElement.dataset.price);
  const priceTotal = priceDay * durationDays;
  const buttonPrice = document.getElementById('btn-booked');
  buttonPrice.value = `Book it now for ${priceTotal} €`;
};


const flatPickrInit = () => {
  flatpickr("#range_start", {
    altInput: true,
    onChange: (dates) => {durationDates(dates)},
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
};

export { flatPickrInit };
// flatpickr(".datepicker", {});
