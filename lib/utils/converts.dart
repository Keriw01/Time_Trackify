String convertStringToUserStatus(String statusString) {
  switch (statusString) {
    case 'absent':
      return 'nieobecny';
    case 'entrance':
      return 'w pracy';
    case 'working':
      return 'pracuje';
    case 'break':
      return 'na przerwie';
    default:
      return '';
  }
}
