fs = require('fs')

jsonFile = fs.readFileSync('data/stock_basic.json');
j = JSON.parse(jsonFile.toString());

o = {
  fields: j.data.fields.slice(1),
  data: {}
}

j.data.items.forEach((i) => {
  o.data[i[0]] = i.slice(1);
});

fs.writeFileSync('data_dump/stock_basic.dump.json', JSON.stringify(o));
