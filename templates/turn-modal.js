let modal = document.querySelector('#turnModal');
let modalDate = modal.querySelector('.card-title');
let modalHour = modal.querySelector('.card-subtitle');
let modalEventId = modal.querySelector('#eventId')
function insertToModal(date, time, eventId) {
    modalDate.innerHTML = date;
    modalHour.innerHTML = time;
    modalEventId.setAttribute('value', eventId);
}