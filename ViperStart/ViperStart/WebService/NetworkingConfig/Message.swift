//
//  Message.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import Foundation

struct Message: Error, LocalizedError, Decodable, Equatable {
    
    static let error = "Ошибка"
    static let formSent = "Форма успешно отправлена"
    static let productIsNotAvailable = "Данного товара нет в наличии"
    static let addedToCart = "Добавлено в корзину"
    static let addProductFromSet = "Выберите товары из комплекта"
    static let inactiveCard = "Ваша карта находится на активации, это займет до двух дней."
    static let invalidEmail = "Пользователь с таким e-mail не зарегистрирован"
    static let invalidPassword = "Неверный пароль, попробуйте ещё раз"
    static let loading = "Загрузка"
    static let useYourNewPassword = "Теперь вы можете использовать для входа ваш новый пароль"
    static let lessThanInStock = "Вы не можете заказать больше единиц товара, чем имеется у нас"
    static let reviewWasSentForModeration = "Ваш комментарий успешно отправлен и появится после проверки модератором"
    static let successRegistration = "Спасибо за регистрацию! Ваша карта будет активирована на списание бонусов не позднее чем через 2 дня. Вы сможете списывать бонусы через 5 дней после покупки."
}

struct Errors: Error, LocalizedError, Decodable, Equatable {
    static let timeOut = "Произошла ошибка соединения. Попробуйте повторить попытку."
    static let noConnection = "Произошла ошибка соединения. Попробуйте повторить попытку."
    static let unknownServer = "Введен неизвестный сервер"
    static let unknownError = "Неизвестная ошибка"
    static let serverError = "Сервер временно недоступен, попробуйте позже"
    static let clientError = "Произошла ошибка при передаче данных на сервер"
    static let incorrectServerResponse = "Некоррeктный ответ сервера"
    static let recommendedProductsConnectionError = "Произошла ошибка соединения. Информация о товаре может быть неполной."
    static let authCancel = "Вы отменили авторизацию."
    static let authError = "При авторизации возникла ошибка."
}
