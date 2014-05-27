describe "An Iter node" do
  parse "m { }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:nil]]]]
  end

  parse "m do end" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:nil]]]]
  end

  parse "m { x }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:call, nil, :x, [:arglist]]]]]
  end

  parse "m { || }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:nil]]]]
  end

  parse "m { |; x| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:nil]]]]
  end

  parse "m { |; x, y| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:nil]]]]
  end

  parse "m { |a| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a], [:nil]]]]
  end

  parse "m { |a; x| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a], [:block, [:nil]]]]]
  end

  parse "m { |a=1| }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args, :a, [:block, [:lasgn, :a, [:lit, 1]]]], [:nil]]]]
  end

  parse "m { |a=1; x| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, [:block, [:lasgn, :a, [:lit, 1]]]], [:block, [:nil]]]]]
  end

  parse "m { |*| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :*], [:nil]]]]
  end

  parse "m { |*; x| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :*], [:block, [:nil]]]]]
  end

  parse "m { |*a| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"*a"], [:nil]]]]
  end

  parse "m { |*a; x| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"*a"], [:block, [:nil]]]]]
  end

  parse "m { |a:| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a, [:block, [:a], []]], [:nil]]]]
  end

  parse "m { |a:; x| }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args, :a, [:block, [:a], []]], [:block, [:nil]]]]]
  end

  parse "m { |a: 1| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, [:block, [:a], [[:lasgn, :a, [:lit, 1]]]]], [:nil]]]]
  end

  parse "m { |a: 1; x| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args, :a, [:block, [:a], [[:lasgn, :a, [:lit, 1]]]]],
       [:block, [:nil]]]]]
  end

  parse "m { |**| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :**], [:nil]]]]
  end

  parse "m { |**; x| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :**], [:block, [:nil]]]]]
  end

  parse "m { |**k| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"**k"], [:nil]]]]
  end

  parse "m { |**k; x| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"**k"], [:block, [:nil]]]]]
  end

  parse "m { |&b| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"&b"], [:nil]]]]
  end

  parse "m { |&b; x| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"&b"], [:block, [:nil]]]]]
  end

  parse "m { |a, | }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a], [:nil]]]]
  end

  parse "m { |a,; x| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a], [:block, [:nil]]]]]
  end

  parse "m { |a, b| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a, :b], [:nil]]]]
  end

  parse "m { |a, b; x| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a, :b], [:block, [:nil]]]]]
  end

  parse "m { |a, b=1| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, :b, [:block, [:lasgn, :b, [:lit, 1]]]], [:nil]]]]
  end

  parse "m { |a, *| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a, :*], [:nil]]]]
  end

  parse "m { |a, *b| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a, :"*b"], [:nil]]]]
  end

  parse "m { |a, b:| }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args, :a, :b, [:block, [:b], []]], [:nil]]]]
  end

  parse "m { |a, b: 1| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, :b, [:block, [:b], [[:lasgn, :b, [:lit, 1]]]]], [:nil]]]]
  end

  parse "m { |a, **| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a, :**], [:nil]]]]
  end

  parse "m { |a, **k| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a, :"**k"], [:nil]]]]
  end

  parse "m { |a, &b| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :a, :"&b"], [:nil]]]]
  end

  parse "m { |a=1, b=2| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args, :a, :b, [:block, [:lasgn, :a, [:lit, 1]], [:lasgn, :b, [:lit, 2]]]],
       [:nil]]]]
  end

  parse "m { |a=1, b| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, :b, [:block, [:lasgn, :a, [:lit, 1]]]], [:nil]]]]
  end

  parse "m { |a=1, *| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, :*, [:block, [:lasgn, :a, [:lit, 1]]]], [:nil]]]]
  end

  parse "m { |a=1, *b| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, :"*b", [:block, [:lasgn, :a, [:lit, 1]]]], [:nil]]]]
  end

  parse "m { |a=1, b:| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args, :a, :b, [:block, [:lasgn, :a, [:lit, 1]]], [:block, [:b], []]],
       [:nil]]]]
  end

  parse "m { |a=1, b: 2| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args,
        :a,
        :b,
        [:block, [:lasgn, :a, [:lit, 1]]],
        [:block, [:b], [[:lasgn, :b, [:lit, 2]]]]],
       [:nil]]]]
  end

  parse "m { |a=1, **| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, :**, [:block, [:lasgn, :a, [:lit, 1]]]], [:nil]]]]
  end

  parse "m { |a=1, **k| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, :"**k", [:block, [:lasgn, :a, [:lit, 1]]]], [:nil]]]]
  end

  parse "m { |a=1, &b| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :a, :"&b", [:block, [:lasgn, :a, [:lit, 1]]]], [:nil]]]]
  end

  parse "m { |*, a| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :*, :a], [:nil]]]]
  end

  parse "m { |*a, b| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"*a", :b], [:nil]]]]
  end

  parse "m { |*, a:| }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args, :*, :a, [:block, [:a], []]], [:nil]]]]
  end

  parse "m { |*a, b:| }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args, :"*a", :b, [:block, [:b], []]], [:nil]]]]
  end

  parse "m { |*, a: 1| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args, :*, :a, [:block, [:a], [[:lasgn, :a, [:lit, 1]]]]], [:nil]]]]
  end

  parse "m { |*a, b: 1| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args, :"*a", :b, [:block, [:b], [[:lasgn, :b, [:lit, 1]]]]],
       [:nil]]]]
  end

  parse "m { |*, **| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :*, :**], [:nil]]]]
  end

  parse "m { |*a, **| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"*a", :**], [:nil]]]]
  end

  parse "m { |*, **k| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :*, :"**k"], [:nil]]]]
  end

  parse "m { |*a, **k| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"*a", :"**k"], [:nil]]]]
  end

  parse "m { |*, &b| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :*, :"&b"], [:nil]]]]
  end

  parse "m { |*a, &b| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"*a", :"&b"], [:nil]]]]
  end

  parse "m { |a:, b:| }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args, :a, :b, [:block, [:a, :b], []]], [:nil]]]]
  end

  parse "m { |a:, b: 1| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args, :a, :b, [:block, [:a, :b], [[:lasgn, :b, [:lit, 1]]]]],
       [:nil]]]]
  end

  parse "m { |a:, **| }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args, :a, :**, [:block, [:a], []]], [:nil]]]]
  end

  parse "m { |a:, **k| }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args, :a, :"**k", [:block, [:a], []]], [:nil]]]]
  end

  parse "m { |a:, &b| }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args, :a, :"&b", [:block, [:a], []]], [:nil]]]]
  end

  parse "m { |a: 1, b:| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args, :a, :b, [:block, [:a, :b], [[:lasgn, :a, [:lit, 1]]]]],
       [:nil]]]]
  end

  parse "m { |a: 1, b: 2| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args,
        :a,
        :b,
        [:block, [:a, :b], [[:lasgn, :a, [:lit, 1]], [:lasgn, :b, [:lit, 2]]]]],
       [:nil]]]]
  end

  parse "m { |a: 1, **| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args, :a, :**, [:block, [:a], [[:lasgn, :a, [:lit, 1]]]]],
       [:nil]]]]
  end

  parse "m { |a: 1, **k| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args, :a, :"**k", [:block, [:a], [[:lasgn, :a, [:lit, 1]]]]],
       [:nil]]]]
  end

  parse "m { |a: 1, &b| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args, :a, :"&b", [:block, [:a], [[:lasgn, :a, [:lit, 1]]]]],
       [:nil]]]]
  end

  parse "m { |**, &b| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :**, :"&b"], [:nil]]]]
  end

  parse "m { |**k, &b| }" do
    [:call, nil, :m, [:arglist, [:iter, [:args, :"**k", :"&b"], [:nil]]]]
  end

  parse "m { n = 1; m { n } }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter,
       [:args],
       [:block,
        [:lasgn, :n, [:lit, 1]],
        [:call, nil, :m, [:arglist, [:iter, [:args], [:lvar, :n]]]]]]]]
  end

  parse "m(x) { |a, b=1, *c, d, e:, f: 2, **k, &l| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:call, nil, :x, [:arglist]],
      [:iter,
       [:args,
        :a,
        :b,
        :"*c",
        :d,
        :e,
        :f,
        :"**k",
        :"&l",
        [:block, [:lasgn, :b, [:lit, 1]]],
        [:block, [:e, :f], [[:lasgn, :f, [:lit, 2]]]]],
       [:nil]]]]
  end

  parse "m(x, y) { |a, b=1, *c, d, e:, f: 2, **k, &l| }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:call, nil, :x, [:arglist]],
      [:call, nil, :y, [:arglist]],
      [:iter,
       [:args,
        :a,
        :b,
        :"*c",
        :d,
        :e,
        :f,
        :"**k",
        :"&l",
        [:block, [:lasgn, :b, [:lit, 1]]],
        [:block, [:e, :f], [[:lasgn, :f, [:lit, 2]]]]],
       [:nil]]]]
  end

  parse "x.m { |a, b=1, *c, d, e:, f: 2, **k, &l| }" do
    [:call,
     [:call, nil, :x, [:arglist]],
     :m,
     [:arglist,
      [:iter,
       [:args,
        :a,
        :b,
        :"*c",
        :d,
        :e,
        :f,
        :"**k",
        :"&l",
        [:block, [:lasgn, :b, [:lit, 1]]],
        [:block, [:e, :f], [[:lasgn, :f, [:lit, 2]]]]],
       [:nil]]]]
  end

  parse "x.m(x, y) { |a, b=1, *c, d, e:, f: 2, **k, &l| }" do
    [:call,
     [:call, nil, :x, [:arglist]],
     :m,
     [:arglist,
      [:call, nil, :x, [:arglist]],
      [:call, nil, :y, [:arglist]],
      [:iter,
       [:args,
        :a,
        :b,
        :"*c",
        :d,
        :e,
        :f,
        :"**k",
        :"&l",
        [:block, [:lasgn, :b, [:lit, 1]]],
        [:block, [:e, :f], [[:lasgn, :f, [:lit, 2]]]]],
       [:nil]]]]
  end

  parse "m { next }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:next]]]]
  end

  parse "m { next 1 }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:next, [:lit, 1]]]]]
  end

  parse "m { x = 1; next x }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args], [:block, [:lasgn, :x, [:lit, 1]], [:next, [:lvar, :x]]]]]]
  end

  parse "m { next *x }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args], [:next, [:splat, [:call, nil, :x, [:arglist]]]]]]]
  end

  parse "m { break }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:break, [:nil]]]]]
  end

  parse "m { break x }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args], [:break, [:call, nil, :x, [:arglist]]]]]]
  end

  parse "m { return }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:return]]]]
  end

  parse "m { return x }" do
    [:call,
     nil,
     :m,
     [:arglist, [:iter, [:args], [:return, [:call, nil, :x, [:arglist]]]]]]
  end

  parse "m { x = 1; return x }" do
    [:call,
     nil,
     :m,
     [:arglist,
      [:iter, [:args], [:block, [:lasgn, :x, [:lit, 1]], [:return, [:lvar, :x]]]]]]
  end

  parse "m { redo }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:redo]]]]
  end

  parse "m { retry }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:retry]]]]
  end

  parse "break" do
    [:break, [:nil]]
  end

  parse "redo" do
    [:redo]
  end

  parse "retry" do
    [:retry]
  end

  parse "next" do
    [:next]
  end

  parse "m { super }" do
    [:call, nil, :m, [:arglist, [:iter, [:args], [:zsuper]]]]
  end
end