#pragma once

#include <QObject>
#include <QItemSelectionModel>
#include "qjsonmodel.h"

/*!
 * \class AppEngine
 * \brief Управляющий класс для связки qml & cpp.
 */
class AppEngine : public QObject {
    Q_OBJECT
public:
    static const QString ITEM_NAME;     // AppEngine
    static const bool IS_QML_REG;
    AppEngine(QObject *parent = nullptr);
    virtual ~AppEngine() = default;

    /*!
     * \brief Возвращает модель JSON.
     * \return модель JSON.
     */
    Q_INVOKABLE QJsonModel *jsonModel();

    /*!
     * \brief Указывает акнивную(выделенную) ячейку.
     * \return модель выделений.
     */
    Q_INVOKABLE QItemSelectionModel *selectionJsonModel();

    /*!
     * \brief Сохранения модели в файл.
     * \param fileName - имя файла
     * \return true, если успешно.
     */
    Q_INVOKABLE bool saveJson(QString fileName) const;

    Q_INVOKABLE bool openJson(QString fileName);


private:
    QJsonModel _jsonModel;
    QItemSelectionModel _selectionModel;

};

