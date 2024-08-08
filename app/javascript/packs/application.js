document.addEventListener('DOMContentLoaded', () => {
    const sections = document.querySelectorAll('.section');
    const links = document.querySelectorAll('.sidebar a');
  
    links.forEach(link => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        const section = link.dataset.section;
  
        sections.forEach(sec => {
          if (sec.id === section) {
            sec.style.display = 'block';
          } else {
            sec.style.display = 'none';
          }
        });
      });
    });
  
    // Default to show the first section
    if (links.length > 0) {
      links[0].click();
    }
  });
  