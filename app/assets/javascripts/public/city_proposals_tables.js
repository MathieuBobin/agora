$(document).ready(function() {
  // First table
  $('#datatables-1').DataTable({
    "pagingType": "full_numbers",
    "lengthMenu": [
    [10, 25, 50, -1],
    [10, 25, 50, "Tous"]
    ],
    responsive: true,
    language: {
      search: "_INPUT_",
      searchPlaceholder: "Recherchez une proposition",
    }
  });

  //Second table
  $('#datatables-2').DataTable({
    "pagingType": "full_numbers",
    "lengthMenu": [
    [10, 25, 50, -1],
    [10, 25, 50, "Tous"]
    ],
    responsive: true,
    language: {
      search: "_INPUT_",
      searchPlaceholder: "Recherchez une proposition",
    }
  });
});