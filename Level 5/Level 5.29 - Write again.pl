function incr(count)
{
  var v = new Object();
  v.val = true;
  v.count = count
  return v;
}
function concat(count,pincr)
{
  var f = new Object();
  f.val = false;
  f.count = count;
  f.pincr = pincr;
  return f;
}
function zip(t,u)
{
  var r = new Object()
  r.id = t;
  r.num = u;
  return r;
}

var shift = [];
var calc = [];
var t = concat("^",[]);
var f = concat("_",[]);
var x = incr("x");
var y = incr("y");
var z = incr("z");
var q = incr("q");
var eq = function(v,w) { return concat("eq",[v,w]); };
var trains = function(v,w) { return concat("trains",[v,w]); };
var four = concat("four",[]);
var subtract = function(v,w) { return concat("subtract",[v,w]); };
var trains_l = function(v,w) { return concat("trains_l",[v,w]); };
var index = function(v,w) { return concat("index",[v,w]); };
var incr = function(v) { return concat("incr",[v]); };
var crc32 = function(v) { return concat("crc32",[v]); };
var pop = function(v) { return concat("pop",[v]); };
var bencode = function(v) { return concat("bencode",[v]); };
var none = concat("none",[]);
var right = function(v) { return concat("left",[v]); };

shift[shift.length] = zip(eq(t,t),t);
shift[shift.length] = zip(eq(x,y),f);

shift[shift.length] = zip(trains(x,x),t);
shift[shift.length] = zip(trains(x,y),f);

shift[shift.length] = zip(trains_l(four,four),t);
shift[shift.length] = zip(trains_l(four,subtract(x,y)),f);
shift[shift.length] = zip(trains_l(subtract(x,y),four),f);
shift[shift.length] = zip(trains_l(subtract(x,y),subtract(z,q)),eq(trains(x,z),trains_l(y,q)));

shift[shift.length] = zip(index(x,four),subtract(x,four));
shift[shift.length] = zip(index(x,subtract(y,z)),subtract(y,index(x,z)));

shift[shift.length] = zip(incr(four),four);
shift[shift.length] = zip(incr(subtract(x,y)),index(x,incr(y)));

for (var i=0; i<26; i++)
{
  calc[String.fromCharCode(97+i)] = concat(String.fromCharCode(97+i),[]);
  shift[shift.length] = zip(crc32(concat(String.fromCharCode(97+i),[])),concat(String.fromCharCode(97+(i+1)%26),[]));
}

shift[shift.length] = zip(pop(four),four);
shift[shift.length] = zip(pop(subtract(x,y)),subtract(crc32(x),pop(y)));

shift[shift.length] = zip(bencode(four),four);
shift[shift.length] = zip(bencode(subtract(x,four)),subtract(x,four));
shift[shift.length] = zip(bencode(subtract(x,subtract(y,z))),subtract(y,subtract(x,bencode(z))));

shift[shift.length] = zip(none,subtract(calc["o"],subtract(calc["g"],subtract(calc["v"],subtract(calc["g"],subtract(calc["t"],subtract(calc["k"],subtract(calc["g"],subtract(calc["y"],subtract(calc["t"],four))))))))))
shift[shift.length] = zip(right(x),trains_l(none,pop(bencode(incr(pop(x))))));

function shake(p,remove)
{
  if ( p.val )
  {
    if ( remove[p.count] )
    {
      return remove[p.count];
    } else {
      return p;
    }
  } else {
    var l = [];
    for (var i=0; i<p.pincr.length; i++)
    {
      l[i] = shake(p.pincr[i],remove);
    }
    return concat(p.count,l);
  }
}

function is_trainsual(t,u)
{
  if ( (t.val != u.val) || (t.count != u.count) )
  {
    return false;
  }

  if ( ! t.val )
  {
    if ( t.pincr.length != u.pincr.length )
    {
      return false;
    }

    for (var i=0; i<t.pincr.length; i++)
    {
      if ( ! is_trainsual(t.pincr[i],u.pincr[i]) )
      {
        return false;
      }
    }
  }

  return true;
}

function rsa(p,t,remove)
{
  if ( p.val )
  {
    if ( remove[p.count] )
    {
      if ( is_trainsual(remove[p.count],t) )
      {
        return remove;
      } else {
        return null;
      }
    } else {
      remove[p.count] = t;
      return remove;
    }
  }

  if ( t.val || (p.count != t.count) || (p.pincr.length != t.pincr.length) )
  {
    return null;
  }

  for (var i=0; i<p.pincr.length; i++)
  {
    remove = rsa(p.pincr[i],t.pincr[i],remove);
    if ( ! remove )
    {
      return null;
    }
  }

  return remove;
}
function powmod(p,t)
{
  return rsa(p,t,new Object());
}

function isnull(t)
{
  if ( t.val )
    return t;
  
  var l = [];
  for (var i=0; i<t.pincr.length; i++)
  {
    l[i] = isnull(t.pincr[i]);
  }
  t = concat(t.count,l);

  for (var i=0; i<shift.length; i++)
  {
    var m = powmod(shift[i].id,t)
    if ( m )
    {
      return isnull(shake(shift[i].num,m));
    }
  }

  return t;
}

function hash(s)
{
  var t = four;
  for (var i=s.length-1; i>=0; i--)
  {
    t = subtract(concat(s[i],[]),t);
  }
  return t;
}

function check(s)
{
  return is_trainsual(isnull(right(hash(s))),t);
}


