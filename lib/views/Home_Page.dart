import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ecommerce_exam/views/Cart_Page.dart';
import 'package:ecommerce_exam/views/extensions.dart';
import 'package:ecommerce_exam/utils/Product_Utils.dart';
import 'detail_page.dart';
import 'dart:js_interop';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selected = "All Products";
  RangeValues slidervalue = RangeValues(1, 5000);

  // get allProducts => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    List images = [
      "data:image/jpeg;base64,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"
          "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAQEBUSEBAWFRUVFRUVFRUVFRcVFRUVFRUWFxUVFRUYHSggGBolGxYWITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGhAQGy0fHyYtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAKIBNgMBIgACEQEDEQH/xAAcAAABBAMBAAAAAAAAAAAAAAAAAQIEBQMGBwj/xABDEAABBAADBAgDBAkCBQUAAAABAAIDEQQSIQUxQVEGEyJhcYGRoQcysRRCUtEjM2JygpKiwfBTshVzwuHxRGOTs9L/xAAaAQEAAwEBAQAAAAAAAAAAAAACAAEDBAYF/8QAKxEAAgIBBAECBgEFAAAAAAAAAAECEQMEEiExE0FhBRQiUXGh4TOBsdHw/9oADAMBAAIRAxEAPwDQNp7QlxMr5pnue97i4lxJqzeVt7mjcANAFFQhezSSVI5AQhChQIQhQgiEIVkBCEKEBCEqhAQlQiFhSVCEQioCEoRYQCckSosLBKkpOpELBKgBKEWFsEoQEoQYWATkicEWBglCROARYWKlSJQgwsUJwSBORYGCUICVFhYoSpAnIMDLXYPSDE4JznQSEZhRadWnUG8u69N/eUKrCFm4Rbtocc+SKqMmiiQlQvQn2hEIQqLBCEKygSJUKEBCEKEBCEqLKYIQkMjRvcPUItpdhHBOWLr2c/7pDiW958vzWTywXqiqZmAShRnY1o4epASwTvkOWOMvPJlvPo0LN54L1K2SJKFMwvR7acp/R4DEHvMEjR/M8AK2w3w423J/6QsHN8kLR6Zi72WMtXjXqX4pM18JVucHwe2q6s8uHYONyyE+jY691bYf4ISH9btBg5hkBcfUyD6LGWuxk+Xkc0MgG8j1R1zefpr9F2PC/BbBD9ZisQ7ub1bAfVhPuraH4UbJaNYXvPAvmk38yI3NtZPXx9BfKyOD9cO/0/NIcQP/ACQF6Mw/QPZzAKwkOnOJj71/90OPdvVphtk4ZhIjYG5fuxjq8t6gAMpZPXexPlPc81YbA4mX9Vh5H/uRvf8A7WpcVg54HhmIifE4tzhsjHRuy2ReV2tWD6FenNmTRyRNkiLsjxmaXZrIO49rWiNVy7454OpMJMBvEsTj/K5g93qYtXKc0mHLpVCDZzEJyQBKu5nz2KlQlCLAxQlCQBOCLCxQlSJQgwMUJQhKEWFioShCIbKFCEi9AegBCVCogISJVZBEJUihBUISqmUIlQlRKZN2JsIY7F4fDdb1XXGRuctzhpYzOOzYu92/eV0zCfAzDj9bj5Xf8uNkY/qL1zbYuN+zzwT3QgxUEjjyjLssnlVDzXqdfA18pQy8M6MVOJzDDfBvAMJtssg4OkxBBPi2ONlequ8H8MtlRuBGCjcK1EhlkJPcXyEAd1K425sOXEvsYt8ceUDq2t+9bg5+axvY4to2Bod4FGF6OBk7JjiZn5M9Ne7MO0AALOtAab7OlnQ3xPJJ+ppSMuD6M4CH9VgsOw82wxg+oFqwEkbSGZmtO4NBAPkFnWMxsvNQvnQv1Wd32Iw4rHRxkB7nWaoBrnHU0PlB4p7ZrZnaxx300jK40a3PqvNZrRfcoQxYd7nNJMeQ8ASD520lJB1tnrMgHDLZPmSs2qFCCoSUilRAtJQu613XWteKchQgjRWgFLRfjPhM+zOs/wBGaOTyJMf1eFvapemuD6/Z2KjqyYXlo5ua3M33aE4OpJgyK4tHnFKE2M2Ae4J6+3Z8BgE4JAlQYWKE5IE5FgYBKgJQiwsUJUBKEGBgEJyEQmvoQkXoj0QqEiVQgIQhQgiVCVQgIRSVFhYiVCVELFyZmSM/FE/1ZUn/AEV5r0/0T2h9pwGGnO+SCJzv3iwZh62vMuEcGyNJ3Zhf7pNO9rXc/glii7ZLYnHtYeaaB3iH5wPSQL43xSPUjowP0N8KxzSsYLe8NHNxAGu5Omia8U9ocORFj0KiN2nhxQY8O00EbS/QcgwHRfJSOgkdc3LmFuHCgXXrWifE+xdEdx0PonpAVRBHyAbysZxLe9Mxg0BUVJIpslHF8gmHFO7lxqT4o4sTSljInxEkRtIIygE5XZgbcSKJvypO6BdL8bLtARzSOlbOX2z7sZovzRg/K1oFZb3Hid62o1eCaTbOyRTOLhZWA4jEBzh1QAvR73tykAgaAaiwSdeSGmjalPhOaxlHflt3rapmKI0H2l+VxkiAsZgwF9gEGg41R3jcrFYHTtZo6Rv8RAPhSxyY5o/F45S0fzOoe6JZLSOaCCDuOh8CosGNa/g7hVdoa8yywB5qVYUos8uz4YwySRHfFJJGfFjyE1b10q6D4+XaOJfh8MXRPkD2vzxtaS9jS/5nA/NfBY4PhdtF3zGFn70hP+1pX1Y5obVbPiTwZNzpM0kJwW7ba+GuKw2GfP1rJOrGZzGB15R8zgTvoa1yBWkhKM4yVowyY5QdSVDglCQJyjMWCckCUIMLFCcEgTgiwMUBCEIhNdQhC9GejFQrDZUTXZiQCRVA61v1pPxmGY3Ug13Kjqx6WU4bk0ViFIEsY3R34lOGLA3Rt9FYPFBdzX7Zl2Rst2JeWtNAC3OIuuQriT/Yq2k6JuDSRMCQCQMtXQ3Xm0TNm4g/ZpTo0uexgIFb65eJU7o9HlEr3VpppwFFzh7BYzk+WinijslJS69iug6KzuAJcxt8CTY7jQpUkkZa4tO8Eg+RpbTsjFSOja8uIyPxBcLIBuPOLHEAuNKl282p3Oqg8NeP4mNJ9yVSk7pnLZnwXR2eWMSNLQDqA4kEjhw4qpc0jQjXitlmncMXhhmIaWQ0AaFOsHRUm1f18v8AzH/7iqTb7DZEpdb+BuN/TY6DcHGDEtHfKw9Z75VyVbr8Jsb1W14LOk8E+H/iYeuHs1oXF8QjeKzbA/qPQChuxL8xaIZDWmYljW/7rryUxQtovotuZzAbFNYHOdpw0Nei+CjsJMNloL2gO4gHMAf3qFrIsWFfbB83K3jK41pZFDfv3LKqIYsSLaVBVk4WCFWpxCzj3xZ2HFh545oWZRP1hkA+XrG5bIHC81+IJWH4STsbtAtc1tvieGEgZg4U4hp4W0OvwC2P41OrCwHlMT5CN1/2XKtk7Tfhp4p2aujeDQ+9Q7Tf4gHN80jsi92KmemVmmwglDSTVDlfsez7KLhcQyWNkkbszHta9jhuLXAFpHkQprGlzKBqj37vIhFnGhGYFjRqT/NkHmGUESQMZ22taPxOoA1zLv8ANLSjCC9Tr4D6m3e6kFgrKRYqqOtjvvejZdFFitsxtOuJgA/ezO9AU122IjuxDj+7HXu4LTsTgPseOyOaCy+zYu43fKdeI3X+yVe4rqngdXvGmgoVX5rWkCfBbP6RwtFAOce/KCe86qM7pQT8kI83fkFSPweU0OKk4bDG6RaRrGqsto9rzvabY2uNC9OOhOq0A9AYjK4mctjJJaxrdQ0nQZnct25dAijy6ALn3STpyIcXJDlAEZDdW3ZyguIuuJryVb5QX0mMo4sjXkRHwXR/Zs+ZrJpWOa5zbLmOByuIuso5dyx4noM6rhxLHi/vNc33bmC1rH9ImEnqY2xg7wxjWXvJNN8U/ZnS6WJ3ZcSLurQWbOunZnPFo5cNV+Cdi+iuNjGbqS9vOMiT2bqPRVBaQaIojQg7we9dG2H0rjmAzjK7uNE+m9XG1diw7QjJcAHj5ZGgZh3H8Te4+y0hrXdTRzZfhcXHdil/Z/7ORBOCn7a2NNg5Mkrd+rXD5XgcQfqN4UALsUk1aPiTi4NxkqYoSoCFVmZrSEIXpT0pmwuIMbrHKqO4qXiMQ9xou7Lh2a0AvgfPQquUvCFjqa8gAOvW9xG6x31y8QqY1kklSfBGcCDR0VpsTAtfJ+kAIyZg2ze8UdPNZptl9a89UQ+gNzwL4aaEcK3rPs2CRk4zxlo6vLZ1GlaZhpwQlLgDL7B4OMAM6tuW7y0CLqro8VMjcBo0AAaaCt2iwYZ3aCefmPiVzMDYxuJdzUtjQ4AuAJ11Kr41ZQfKP85oyAxwYOQ9FS9MIh9nBrdI0+zh/dXqqulDLwr+4tP9Q/NGL+pAs0NWOwsb1GJws+7qcXCSeUchyy+wA81XpszM0cjecZP8hD/ow+qeojuxtGmN1JHrVR8bJlZm6xsYBFucLGulaka2QovRraH2nBYef/VhiefFzAXD1tWD9xo1pv3130vNdM+iRsAbs9Y9+7Vzco/h7IClqvwEgebGIMtDXKGhhuxvA11B0vRWCjKQKvlFOPirBQsUO14hXEjOY/Gw/oMOOb5P/r/7rjsT9L8HelOPs4r0V0v6Kx7SYxskr4zGXFpZlItwAOYEajTgQqzZPwu2ZEwNfE+d1Vmke7kBo1hAG7lep1TNY5EopEL4N7b67CPwrj28K6m98Mluj9O03wAXRo2Z2ubZF0baaOhvQqBsTYEODi6rDRdWyy6sznWSALJcSToArWGAtNkotmT5doiYbZ8MdysaS4ZxmcXE76cK8W8AuafEHbO3xtB+HwIn6n9EWGDDNdbXxkyF87wQxwe2gNNHd2vXKSF4HFEhxTYfRrbUZkxOOEjmUD+nxImlFOJBa1tta3U2LFLcsLJur/N35BbpPI3VpF2KI4EEblUYfZMLNAHEX9516eQCcXwCaspJXEvrXhuo+29WeEjawZnEN73EAD1Vnj9jRPhkY1tOfG9odZzNLmkAtdvBF7wvNkEznta55LnUAS4kmxodT3rTFDyN8mOpz+GK4s7xL0owUJObFRngQ14efRt6rkPT4x4qUy4aIubrchsWRvoEA+arIjRB5G/RXvRvHNna6E6Oo1uRzrxVXJlp5LU8S4+xz/Z4AeOs1aD2hdX5hNkmAccvy2cvcL7OqybRwro3yNcaLXOBFcioz26UsyvZl7s7FODQaPiuqfD7bJPYeTrpquPYGUuZR4LY+je1+pePFZTjfKFhzbJU+jtu3Nkx4uAxP46tdxY7g4f5qLXJI+j2LMjoxA4lri0mqbYNaOdQIXTti7ca9rb3H6q0xbOIV4c23g01mkhnSn6r9o5xhOgkxFyzMZ3NBefPcPqhb4ULo8kjiWkw/b9nnBKkQvXHWKnMO8d301/smJ8e/wDzioQlYeT9E4aW3UWAeO6j5nyV3gcW/r8oltpboNSBpdgkblTYWFoJ/SxkUbHaB8g4Czv9Va4KJ/WxkDshvBzXV2a1y+I4LKVFcF7h5CXkUNCK4E2OJ8bWRkodZ1GpB8Wkg1x3hY4GkS2Rva31Bd+YQzR7x+3/ALg131JXOzNsWIX8rgfOj6KwhkAABNHkqjBMttd7x/UQsro2mKFzhoQ3Nw0cwnh30qkgMuQoW2svUSBx0ynQVmNa6Xx0VTPDG09Yx7gQDTbGU6EC6F8earC+twHfx+qkcds3xaWWXrggHBg3lcRXBzSL8x+QWGFuV4DhWoBv8LtD7Eq2ZITxr2+irNoav8lrKPFMefTeGO67O3/BPGmTZDI3G3YeSWB3cWvztHk17Qt8XI/gXjamx0B3OMOJaO+Vp6z3DAuuLzGWO2bR0RdqyqdiLc5pxNkGi2FlubqNHfOQfRWqFjdM0cUOyzIscsQdvTW4gEgAJ07iG2FCA2Fo4JwcNwIVDtvaww7A972AXqZHhjaAugTpZNDztTdm4pkoZJE8PY8Atc02HNcNCCr2lbjNjtqRQxukleGMaLc95DWgd5KxYHarJ2Mlhc10b9WuGoIurHuqnpphhJgMWwi7gmod4Y5zfcBax8GNqCbZvVfew8j2HW7a8mVp8O25v8KW1VYXJ3Rv+NkcM1AuI3NurUPAYgvBJIO7UCvblu91YYjeDzAVTsyERue3rQ4k3lArKL46nn3IlspvjAZRsmd8JcHARPtji05RKzPu3jLdjktV+DPSiSSIYR8U8tOe5s9Zo2NPaLZXuNg5iaq7zbtLXWXx5mjS94ISR4V9nM4VwaBu8TeqtMpptkthsA9y817cwvU43FRVWTEzUP2XOL2f0uC9FYzaEGGZmnmZE0feke1g9XFcB6b4/DYjamIlwsokZI2JxcAQM7WBjgLAv5WmxpqtdO6mcuvV4ioaDwVlh3sgcx7dSHHNXB28/wAJ19FXx3YrfwrU2rKfYOKdH1jIJAOILTx5NOrm+SerTaRyaCeyTfqU23TFi55HMsGxqBYNAX5fkqPFYV0Zpw37jwI5hXceDljcc0L2d4a6vpY/zco+25i8tH4QQDVHhvHkuPrg65Su5PsgYD5q5qbq0qPDHVf5uU5zczb4pWck+eTZtibXIaBe6l0vAbZD4he+lyPo9gXOdZ3LcopMgoLBwW7g6MeplGJe4vHk7kKobJaE7MXJs5ChKhe3OsRKEJVTKHNNEdxV1hgC9h5PG/iA3X2H0VSyIPOjgL4G7+lKfCwMfmc4XlcB22AWWkAnXv8AZZyC2bW1tSMoUCHDz0I9gUswIkIvTK0jjxde/wAAoDtvRktOUDK6/nZuog8f2kYzazcwOUAgEOa57Qe1RG4nv9Vz0zNk3ANLi7cA12+uYB3A79U6QXhyK0be7U/o3HcP4VXt2wWX2GC60zu0oVrTOIASR7dY0ZXFnzPJoyH5yTX6vvKpphIsklcCRY10HHxUZ6SfGtaMoOYigaB4Udbr0UR+NPALWLo+jp9TCCdk6NpVbjPnPl9Amvned7j9ExSUrMNTqllVJG4/CjG9VtjD66TwTYc/vMPXC/JrQvQK8t7Hxv2fEYae6EOLhc48o3nLJ7ADzXqRef1kays1wO4IrsYXDNWp1ygnS60C16bacrs7Wydpt2yGJ0rtwGUPeA0ODjv4WLWzYsdrxCqtpdZ2WxFzScx7IBHZo9qxx3cPmJ4BYxFImwW0NskkVqd5rnSspBYPgq8Kwj3DwRkJHOPiV0RxG0/swgdG3qjLnMhIoP6ui0NabPYOmi2DolsX7BhI8P1plyZjmIDdXOLiGjWm2TQsq/ODBsO1BsV3HgoeN2hgcC0CaaGFo3Nc5re/st4+QV7rVB2U7JOLhzEgiw4URwIIohRdm7LMTcrY4o2gANZE3KBV8tPYcVqW1vjBs6KxA2Wc8C1vVs83Po+jStJ2v8Y8fLYgjiw7edda8fxOpv8ASrUZBlkgvU7oYhQzHdeu5a9tXpxsrCWJMVGXD7sdyuvkcl5T40vO+1Nv4zGfr8RLMDwLiWeTdGDyUFuHed9D3KSxGMtSl0jsW1/jXGLGEwjnftTODB/Iy7HmFo+2PidtXE2PtHVA/cw7ch8nayf1LWBFGDTnWe9wHtp7pW41jR2GXrqBoBXeAb4q9kUYvNkl1f8Agc3DT4h+Z5c5x3vkJc4+JNn1W79EuicLTnmJkdWjNQ3eDdDU7vBahDjnFriHAAjQNa8ub/EMuqlxYkEMvtkaU54mP/xuA18Heqv8Gdu/qOq4LaOEhoR9U2yR2QG2RoRYGpVnDtKNxoOFjeLFi91jeFytr6BjcSGkWM8hhjHJgaQ5p032pDJDQdGx2hIcImdUx5qgXOicbA5gHwQZopnVHSNcC11EEEEHcQd4WhdIug338MLb+D7zfD8Q91Dw+05ySGYg0flMYZMG1vzHs14Eeas8J0mlb+tDRwAc9sbj3kPytHk5yDjZe9Ps57isC6M0QRR17lM2fhXPcB5HyXROsjxwAlwriDf6QjLl365jRcNPu5gsP/CIsP8AJr471lJNGbiu0RMJAImrFLJqpEpUcssoGMmTsMLCFKwMOiEhJHGdeaW+9NpFL252jwe9ZY2ircTXADefPgFgAVnhtlSSxgsABbejjkzA620u0I15oN0FkR+Jcd3ZFVlboKHPifErHf8AlqZ/wifgwHwfG76OSHY+I/0HnwaT9EbQbMeC/WMs12m792/S+5ScS7qrANucTcmtAXq2M8+bvEDja7OwczJWkwuG/wCaM1qCNcwpWErMWWNbHQaBwe0OJ4kgnnaDYG+SiL73uJ81lwgJdoTYBI8a4d6zTYmVjssjGEjeHRsv1aAfdJDjWNcHdQ0EcWOc3x0dmHsqbKZEB70Zu9WcmIw0gNROY4igW5XAbtaBb9FFmwLhRBzXwyuDvQj6FGw2R86UPTSCEBFlDpBnjkbzjcfNlP8A+heoeie0ftWAw053yQRPd+8WDMPI2vMWGdT2k7rF+B0Pta3bol8V2bM2dHgzhpJpoXStsvayPKZHFva7TtLqsvBfK18Lkmjs0suGjvE0OatapY5GRxtLnuAaN7nEADxJ0XnbbPxj2tPYidHh28BEwOfXIvkv1AC07G4rF4t2aeSaY7wZXOfV8sxoeS4ljbN3kSPR+1/ifsfC2PtIlcPu4cdbfdnHYB8XBaRtj45PNjB4MN5PndZ842f/ALXKY9lP+8Q33KzfZIWfO6/3jXsOC1WD7mMsz9C62v8AETauKsPxj2A/ch/RDwtnbI8SVr4ikcS4g2dS5x1J5m9Vn+2xtprGb92XLXnRUZ+OJLhuADtfLTxPcn9Ef4M3vl/JKiwXFz+/TT1JSPETORIF6kXuvTMePClW5y/5j2r7OrWgcySa1TR2uBsWdBZcd5c43y1tB5PsivF92WDsdZyjsnX56aAKscd/coMmJc+7J13DSq8f7pu8Ek68zmsnknEZq11G+3Cq5C0HJvsShGPSGh187GnE3+SeznpfHUfQhNYOIu9woaeoKksG77vmdT6qkVJ0ZYQbseYsN+hv1UzDFx0jJ1+63QfzEEelJmGwcjjYjzDm+2geu/yCtsJsoj55CB+Fu71dfsAkcsuTEJ3wHN2QRduzCVzeYOYivfwVhA/ODWHzufo98tsFUd1MBvXgD4rNhsCxmrYwD+I/N6nVTGs5osqxuBw8g+fEPA0prcpAHLO5tlXeAMMZzNbbvxuJe/XU9pxJruVRlSiwiyt7RsuI2rpQOpUR8ubioUMZI1UjJSwnY91iOCkYeC0yFlqewUEUVRIZTQhQZpylV2XuRxu0ApXsLSQRRBIII3EaEHzSBe3s6hbWw4raT2YVjBJeaNoA3lo0B8NLWvBZzGSB2vJB8hZhKRum5LlQAqKJWHxEgOkrx4OP5rO3a2JbuxEnm4kehtQmBKQgwMnx7Vlc4B5Y4EgHPFG7QnU/Lam484YgZWgO7OgjawE/tanuO5UY0U7amNbI+2NDRpQAqqHHmbQaAyPJi3ndTQeDGho9lY/bP0DWFxaHEBxA1qjZ/aUDBYCWY1DE+T9xpIHiRoPNbHgegWMkAz5Ih+07M7+Vtj1IWc8kY9svxuXSNVdvKRdNwHw7wzNZpHynkP0bfQdr+pbFgtiYaD9TAxh5hozebjqfVc09XBdcmqwSfZyLCbDxUurYXV+JwyDxt1X5Kp2lhcmKk65jgCQdDvcQMxHMXfLeu64jD2qDauwY5gQ9gN8eK5p5fJVmix7Ojm+EbCP1bW33/N77/JZMRO8CmsF95rw4Kx2l0Le3WI2BrlP+d5VHJFi4AWvbYFluYE+Dbvd6Kbv+QH7kKXFzCy4d1Ucuul2PzUZ7HZRZOXfq4CyOLQTr40ruLGRv+Zrm87AIvjoCdO/VOdsmKQWytNbZXu0/3CylC+Uy1kSKKRxd29bFcBTQNBRu70HBI8jskZb5AuvfvdZ0J7laTbKkLt+dvAZsteVVXgoAY5hNksIGm8HwHMLJxa7GpJ9DXanNZNfMS4OJJ+o0SPGmatSeQAA4VR/twU7CbImkb2Y9Cfmd2fqL9CrfC9Fhp1jz3hu71IVUwuSRrj9KIruAPv8ANYN8FYYTY2Jl1EZ7Wpc80Deut6n0W54DZMMfyRtB51r6q3ihUozc7NEHRwt+d99zRXuf+ym4PZzWnst158fU6rcXYEHgskOy28ldpGTi2UWHwLirCHZx5K9gwAG781NZCAN3og5CWM1SbDFqjq82q0Kjc5GzGfDFCezesWYrBHj484a053E7m6+p3KmZ2bBCzRPeEMBpZGi1g2bpD8JEpEwWSFtBYMS5Qt8Igzu1QsbgXGmgk92qFRjyQvijgYWbRfliY3MGudTGjM5wtzjQ1JOpK1P7Oz8DfQJEL0+nb8UfwfTl2KMOz8DfQJ3UM/A30CVC1bYBOoZ+BvoEvUM/A30CEI2yqFEDPwN9Al6hn4G+gQhVbKaHDDs/A30C2PobgIZJyHwxuAAoOY13PmEIWOZvYyRS3I6GGAaAAAbgBQHknho5IQvlnSGUckuUckIVEGuaOSjSMHIeiEKFMhyxt5D0Vdi4GEG2tPiAhCaAzR9tYSMONRtH8IVdFE0ahoBHGghCUuzGuDYI42mJji0Em7JAs7t5WZkLaHZHoEIVFGVkbfwj0WaONv4R6IQiyiXHG3kPRS42DkPRIhBlkqNg5D0UljByHohCDEjOxo5BZco5IQiIqNqMHIeio3xtv5R6BCFDlydlLtlozhtCqGnD0VnsTDRgghjR4NCEIvoLXRfZByHos0DBe4eiELFmqJzmitwUHFNHIJEJBkbJ8P4GVK7K3NYGahdHUi+Wg9EIQkujvwf00f/Z"
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStdofmGblal9GWOsS3kV8DQXX-HZxcDajGXg&s"
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKLGT-Oo66BGKIofWS9Vh5lX6PXdh6DALRRA&s"
    ];
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('CartPage');
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: allProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 0,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (BuildContext context, int index) {
            final element = allProduct[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('detail_Page', arguments: element);
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.07),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.07),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.07),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.07),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.07),
                      blurRadius: 32,
                      offset: Offset(0, 16),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.07),
                      blurRadius: 64,
                      offset: Offset(0, 32),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.35),
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                              element['thumbnail'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      11.toHeight(),

                      Text(
                        element['title'],
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      10.toHeight(),
                      Row(
                        children: [
                          const Text('Price :'),
                          Text(
                            element['price'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
